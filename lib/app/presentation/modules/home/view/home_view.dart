import 'package:cmovil_v4/app/presentation/modules/home/controller/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CMovil V4 - Home')),
      body: Center(
        child: Consumer(
          builder: (_, ref, _) {
            final notifier = ref.watch(homeProvider);
            return Text(
              '${notifier.state}',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => homeProvider.read().increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
