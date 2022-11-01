import 'package:flutter/material.dart';
import '../components/task.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  bool opaco = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
      ),
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 800),
        opacity: (opaco == true) ? 1 : 0,
        child: ListView(
          children: const [
            Task("Estudando Flutter", 'assets/images/img1.png', 5),
            Task("Andar de Bike", 'assets/images/img2.png', 2),
            Task("Estudar", 'assets/images/img3.png', 1),
            Task("Tranquilizar", 'assets/images/img3.png', 4),
            Task(
              "Jogar",
              'assets/images/img2.png',
              3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opaco = !opaco;
          });

          // Add your onPressed code here!
        },
        child: const Icon(Icons.remove_red_eye),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[300],
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
