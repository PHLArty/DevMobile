import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  // Getter for counter
  int get counter => _counter;

  // Methods to handle counter actions
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter Screen'),
            actions: [
              IconButton(
                onPressed: () => counterProvider.resetCounter(),
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Current Count:',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${counterProvider.counter}', // Use the getter here
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => counterProvider.decrementCounter(),
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => counterProvider.incrementCounter(),
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
