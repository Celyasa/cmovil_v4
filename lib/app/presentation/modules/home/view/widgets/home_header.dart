import 'package:cmovil_v4/app/domain/models/usuario/usuario_perfil.dart';
import 'package:cmovil_v4/app/presentation/global/theme/app_colors.dart';
import 'package:cmovil_v4/app/presentation/global/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

final class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.initials,
    required this.userName,
    required this.modulos,
    required this.moduloSeleccionado,
    this.onModuloChanged,
    this.onRefresh,
    this.refrescando = false,
  });

  final String initials;
  final String userName;
  final List<UsuarioModulo> modulos;
  final UsuarioModulo? moduloSeleccionado;
  final ValueChanged<UsuarioModulo>? onModuloChanged;
  final VoidCallback? onRefresh;
  final bool refrescando;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final tieneMultiplesModulos = modulos.length > 1;
    final tieneUnSoloModulo = modulos.length == 1;

    final chipStyle = AppTextStyles.labelSmall.copyWith(
      color: theme.brightness == Brightness.dark
          ? AppColors.lightBackground
          : const Color(0xFF374B5C),
      fontWeight: FontWeight.w600,
      letterSpacing: 0.3,
    );

    final moduloActual = moduloSeleccionado == null
        ? null
        : modulos
              .where(
                (modulo) => modulo.usrIdExt == moduloSeleccionado!.usrIdExt,
              )
              .firstOrNull;

    final almacen = moduloActual?.almNombre.trim() ?? '';
    final moduloVisible = tieneUnSoloModulo ? modulos.single : moduloActual;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.brandRed,
            child: Text(
              initials.trim().isEmpty ? '?' : initials.toUpperCase(),
              style: AppTextStyles.titleMedium.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userName.trim().isEmpty ? '—' : userName.trim(),
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                if (modulos.isEmpty)
                  Text('SIN MÓDULOS', style: chipStyle)
                else ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: theme.brightness == Brightness.dark
                          ? AppColors.darkSurface
                          : const Color(0xFFE2EAF0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: tieneMultiplesModulos && onModuloChanged != null
                        ? DropdownButton<UsuarioModulo>(
                            underline: const SizedBox(),
                            value: moduloActual,
                            hint: Text('SELECCIONAR MÓDULO', style: chipStyle),
                            isDense: true,
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ),
                            dropdownColor: theme.cardColor,
                            borderRadius: BorderRadius.circular(12),
                            style: chipStyle,
                            onChanged: (UsuarioModulo? modulo) {
                              if (modulo != null) {
                                onModuloChanged?.call(modulo);
                              }
                            },
                            items: modulos.map((modulo) {
                              return DropdownMenuItem<UsuarioModulo>(
                                value: modulo,
                                child: Text(
                                  '${modulo.modNombre.toUpperCase()}-${modulo.usrIdExt}',
                                  style: chipStyle,
                                ),
                              );
                            }).toList(),
                          )
                        : Text(
                            moduloVisible?.modNombre.toUpperCase() ??
                                'SIN MÓDULO SELECCIONADO',
                            style: chipStyle,
                          ),
                  ),
                  if (almacen.isNotEmpty) ...[
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Icon(
                          Icons.store_outlined,
                          size: 13,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            almacen,
                            style: AppTextStyles.labelSmall.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontSize: 10,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ],
            ),
          ),
          if (onRefresh != null) ...[
            const SizedBox(width: 8),
            IconButton(
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
              icon: refrescando
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(
                      Icons.refresh,
                      color: AppColors.brandRed,
                      size: 22,
                    ),
              tooltip: 'Refrescar datos',
              onPressed: refrescando ? null : onRefresh,
            ),
          ],
        ],
      ),
    );
  }
}
