import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is page 1",
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: const Text('Go to page 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is page 2",
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 25),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('Back page 1')),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
              },
              child: const Text('Go to page 2'),
            ),
          ],
        ),
      ),
    );
  }
}


class ThirdPage extends StatelessWidget {
  ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is page 3",
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 25),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text('Back page 2')),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                  (route) => false
                );
              },
              child: const Text('Go to page 1'),
            ),
          ],
        ),
      ),
    );
  }
}