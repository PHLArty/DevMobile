import 'package:flutter/material.dart';
import 'package:flutter_group31/Example2.dart';
import 'package:flutter_group31/Excercise1.dart';
import 'package:flutter_group31/example.dart';

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
      home: LoginScreenExample(),
    );
  }
}




