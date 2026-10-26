import 'package:cmovil_v4/app/presentation/modules/home/controller/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CELYASA'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            // CONSUMER 1: El Combo Box (Dropdown)
            Consumer(
              builder: (_, ref, _) {
                final notifier = ref.watch(homeProvider);
                final currentId = notifier.state;

                return DropdownButton<int>(
                  value: notifier.modulos.containsKey(currentId)
                      ? currentId
                      : 1,
                  items: notifier.modulos.entries.map((modulo) {
                    return DropdownMenuItem<int>(
                      value: modulo.key,
                      child: Text(modulo.value),
                    );
                  }).toList(),
                  onChanged: (int? nuevoId) {
                    if (nuevoId != null) {
                      homeProvider.read().setModulo(nuevoId);
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 30), // Espacio intermedio
            Consumer(
              builder: (_, ref, _) {
                final notifier = ref.watch(homeProvider);
                return Text(
                  '${notifier.state}',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => homeProvider.read().increment(),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Indicadores',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Clientes'),
          BottomNavigationBarItem(icon: Icon(Icons.sync), label: 'Sync'),
        ],
      ),
    );
  }
}
