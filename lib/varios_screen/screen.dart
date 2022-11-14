import 'package:flutter/material.dart';
import 'package:tarefas/components/task.dart';
import 'package:tarefas/data/task_dao.dart';
import 'package:tarefas/data/task_inherited.dart';
import 'package:tarefas/varios_screen/form_screen.dart';

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
        actions: [
          IconButton(onPressed: (){
            setState(() {
              
            });
          }, icon: Icon(Icons.refresh))
        ],
        title: const Text("Tarefas"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? itens = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                 return Center(
                   child: Column(
                     children: [
                       CircularProgressIndicator(),
                       Text('Carregando ...'),
                     ],
                   ),
                 );
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando ...'),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Carregando ...'),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && itens != null) {
                    if (itens.isNotEmpty) {
                      return ListView.builder(
                        itemCount: itens.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Task tarefa = itens[index];
                          return tarefa;
                        },
                      );
                    }
                    return Center(
                      child: Column(
                        children: [
                          Icon(Icons.error_outline, size: 128),
                          Text(
                            'Não há nenuma Tarefa',
                            style: TextStyle(fontSize: 32),
                          )
                        ],
                      ),
                    );
                  }
                  return Text('Erro ao carregar Tarefas');
                  break;
              }
              return Text('Erro desconhecido');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          ).then((value) => setState((){
            print('Recaregando tela inicial');

          }));
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
