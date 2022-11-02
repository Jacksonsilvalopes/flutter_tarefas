import 'package:flutter/material.dart';
import 'package:tarefas/varios_screen/form_screen.dart';
import 'data/task_inherited.dart';
import 'varios_screen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: TaskInherited(
        child: Screen(),
      ),
    );
  }
}
