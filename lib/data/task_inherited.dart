import 'package:flutter/material.dart';
import 'package:tarefas/components/task.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  //criado lista de tarefas
  final List<Task> taskList = [
    Task("Estudando Flutter", 'assets/images/img1.png', 5),
    Task("Andar de Bike", 'assets/images/img2.jpg', 2),
    Task("Estudar", 'assets/images/img3.jpg', 1),
    Task("Tranquilizar", 'assets/images/img4.jpeg', 4),
    Task("Jogar",'assets/images/img5.jpg',3,),
  ];

  void newTask(String name, String photo, int difficulty){
    taskList.add(Task(name, photo, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return true;
  }
}
