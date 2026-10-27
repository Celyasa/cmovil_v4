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
                  onRefresh: controller.reintentar,
                ),
                const SizedBox(height: 20),
                const CommercialBanner(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
