import 'package:flutter/material.dart';
import 'package:flutter_group31_5/Excercise24_12/screens/todo_list_screen.dart';
import 'package:flutter_group31_5/Excercise24_12/screens/todo_list_screen_get.dart';
import 'package:flutter_group31_5/Excercise24_12/screens/todo_list_screen_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    // ChangeNotifierProvider( 
    // create: (context) => TodoListProvider(),
    // child: const MyApp(),)
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoListScreenGetController(),
    );
  }
}


