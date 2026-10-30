import 'package:cmovil_v4/app/presentation/global/widgets/app_snackbar.dart';
import 'package:cmovil_v4/app/presentation/modules/home/controller/home_provider.dart';
import 'package:cmovil_v4/app/presentation/modules/home/utils/home_utils.dart';
import 'package:cmovil_v4/app/presentation/modules/home/view/widgets/commercial_banner.dart';
import 'package:cmovil_v4/app/presentation/modules/home/view/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, _) {
        ref.listen(
          homeProvider,
          callback: (controller) {
            final state = controller.state;
            final error = state.mensajeError;
            final exito = state.mensajeExito;
            if (error != null) {
              controller.limpiarError();
              AppSnackBar.error(context, error);
              return;
            }
            if (exito != null) {
              controller.limpiarExito();
              AppSnackBar.success(context, exito);
            }
          },
        );
        final controller = ref.watch(homeProvider);
        final state = controller.state;
        final perfil = state.perfil;
        final empresa = perfil?.empNombre.trim() ?? '';

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(empresa.isEmpty ? 'CMovil 4' : empresa),
            actions: [
              IconButton(
                tooltip: 'Menú',
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(
                  initials: HomeUtils.obtenerIniciales(perfil?.usrNombre ?? ''),
                  userName: perfil?.usrNombre ?? '',
                  modulos: perfil?.modulos ?? const [],
                  moduloSeleccionado: state.moduloSeleccionado,
                  onModuloChanged: controller.seleccionarModulo,
                  onRefresh: controller.actualizarPerfil,
                  refrescando: state.cargando,
                ),
                const SizedBox(height: 20),
                CommercialBanner(
                  isDownloading: state.descargandoPortafolio,
                  onViewPortfolio: () {},
                  onDownloadPdf: controller.descargarPortafolioPdf,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
