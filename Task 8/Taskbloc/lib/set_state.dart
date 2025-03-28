
import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App : Set Satate')),
      body: Center(
        child: Text('Counter: $_counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
