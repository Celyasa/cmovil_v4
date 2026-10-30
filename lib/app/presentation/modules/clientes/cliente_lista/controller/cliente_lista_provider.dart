import 'package:cmovil_v4/app/presentation/modules/clientes/cliente_lista/controller/cliente_lista_controller.dart';
import 'package:cmovil_v4/app/presentation/modules/clientes/cliente_lista/controller/cliente_lista_state.dart';
import 'package:flutter_meedu/providers.dart';

final clienteListaProvider =
    Provider.state<ClienteListaController, ClienteListaState>(
      (_) => ClienteListaController(),
    );
