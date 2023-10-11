import 'package:flutter/material.dart';
import 'package:todo/home_screen.dart';
/// todo application
/// CRUD - Create, Read, Update, Delete


void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


