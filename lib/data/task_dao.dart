import 'package:tarefas/components/task.dart';

class TaskDao {
  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  static const String tableSql =
      'CREATE TABLE $_tablename($_name TEXT,$_difficulty INTEGER,$_image TEXT)';

  save(Task tarefa) async {}
  Future<List<Task>> findAll() async {
    return [];
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    return [];
  }

  delete(String nomeTarefa) async {}
}
