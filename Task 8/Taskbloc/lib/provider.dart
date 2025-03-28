import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Example')),
      body: Center(
        child: Consumer<Counter>(
          builder: (context, counter, child) {
            return Text('Counter: ${counter.count}');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}