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

  save(Task tarefa) async {
    print('acessando o save:');
    final Database bd = await getDatabase();
    var itemExist = await find(tarefa.name);
    Map<String,dynamic> taskMap = toMap(tarefa);
    if(itemExist.isEmpty){
      print('acessando inserirndo tarefa:');
      return await bd.insert(_tablename, taskMap);
    } else {
      print('atualizando tarefa:');
      return await bd.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.name],
      );
    }
    
  }
  Future<List<Task>> findAll() async {
    print('acessando o findAll:');
    final Database bd = await getDatabase();
    final List<Map<String, dynamic>> result = await bd.query(_tablename);
    print('Dados encontrados: $result');
    return toList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Acessando o find:');
    final Database bd = await getDatabase();
    final List<Map<String, dynamic>> result = await bd
        .query(_tablename, where: '$_name =?', whereArgs: [nomeDaTarefa]);
    print('Tarefas encontradas: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeTarefa) async {
    print('acessando o delete:');
    final Database bd = await getDatabase();
    return bd.delete(_tablename, where: '$_name =?',
    whereArgs: [nomeTarefa],);

  }

  List<Task> toList(List<Map<String, dynamic>> mapDetarefas) {
    print('convertendo to list');

    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapDetarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarefa em Map');
    final Map<String, dynamic> mapaDetarefas = Map();
    mapaDetarefas[_name] =  tarefa.name;
    mapaDetarefas[_difficulty] = tarefa.dificult;
    mapaDetarefas[_image] = tarefa.imagem;
    print('Mapa de Tarefas Criado');

    return mapaDetarefas;
  }
}
