import 'package:flutter/material.dart';

class ClienteListaView extends StatelessWidget {
  const ClienteListaView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Clientes'), centerTitle: true),
    );
  }
}
