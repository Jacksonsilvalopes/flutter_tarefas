import 'package:flutter/material.dart';
import 'package:tarefas/data/task_dao.dart';

import 'difficult.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {
  final String name;
  final String imagem;
  final int dificult;

   Task(this.name, this.imagem, this.dificult, {Key? key})
      : super(key: key);
  int nivel = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    height: 140,
                    width: 372,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: LinearProgressIndicator(
                                    color: Colors.white,
                                    value: (widget.dificult == 0)
                                        ? widget.nivel / 10
                                        : (widget.nivel / widget.dificult) / 10,
                                  ),
                                ),
                                Text(
                                  "Nivel: $widget.nivel",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    )),
                height: 90,
                width: 372,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(5))),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(5)),
                      //utilizando  metodo Dart para definir imagem
                        child:(widget.imagem.contains("http"))? Image.network(
                          widget.imagem,
                          fit: BoxFit.cover,
                        ):Image.asset(
                          widget.imagem,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Difficult(dificultLevel: widget.dificult,tarefaLevel:widget.name),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 0),
                      child: ElevatedButton(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text("Up"),
                            ],
                          ),
                          onLongPress: (){
                            TaskDao().delete(widget.name);
                          },
                          onPressed: () {
                            setState(() {
                              ++widget.nivel;
                            });
                          }),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}