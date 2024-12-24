import 'package:flutter/material.dart';
import 'package:flutter_3_12/flutter_02.dart';
import 'flutter_01.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Provide an instance of ScaffoldExample here
      home: ImageExample(),
    );
  }
}