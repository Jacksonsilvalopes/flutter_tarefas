import 'package:flutter/material.dart';
import 'package:tarefas/varios_screen/form_screen.dart';
import '../components/task.dart';
import '../data/task_inherited.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
      ),
      body: TaskInherited (
        child: ListView(
          children: const [
            Task("Estudando Flutter", 'assets/images/img1.png', 5),
            Task("Andar de Bike", 'assets/images/img2.jpg', 2),
            Task("Estudar", 'assets/images/img3.jpg', 1),
            Task("Tranquilizar", 'assets/images/img4.jpeg', 4),
            Task(
              "Jogar",
              'assets/images/img5.jpg',
              3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[300],
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
