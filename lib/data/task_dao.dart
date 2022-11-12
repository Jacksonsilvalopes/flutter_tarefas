import 'package:sqflite/sqflite.dart';
import 'package:tarefas/components/task.dart';
import 'package:tarefas/data/database.dart';

class TaskDao {
  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  static const String tableSql =
      'CREATE TABLE $_tablename($_name TEXT,$_difficulty INTEGER,$_image TEXT)';

  save(Task tarefa) async {}
  Future<List<Task>> findAll() async {
    print('acessando o findAll:');
    final Database bd = await getDatabase();
    final List<Map<String, dynamic>> result = await bd.query(_tablename);
    print('Dados encontrados: $result');
    return toList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    return [];
  }

  delete(String nomeTarefa) async {}

  List<Task> toList(List<Map<String, dynamic>> mapDetarefas) {
    print('convertendo to list');

    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapDetarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }
}
