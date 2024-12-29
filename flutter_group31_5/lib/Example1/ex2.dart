import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  const CounterScreen({super.key});


  @override
  State<StatefulWidget> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;


  void _increament() {
    setState(() {
      _counter++;
    });
  }

  void _decreament() {
    setState(() {
      _counter--;
    });
  }

  void _resetcounter() {
    setState(() {
      setState(() {
        _counter = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [IconButton(onPressed: _resetcounter, icon: Icon(Icons.refresh))],
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
              '$_counter',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold   
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _decreament, child: const Icon(Icons.remove)
                ),
                const SizedBox(width: 20,),
                ElevatedButton(onPressed: _increament, child: const Icon(Icons.add))
              ],
            )
          ],
        ),
      
      ),
    );
  }

}