import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

import '../data/task_inherited.dart';

const String _mesagemTarefa = "Digite a Tarefa";
const String _mesagemDifficulty = "Insira Difficult entre 1 a 5 ";
const String _mesagemUrl = "Insira URL válida";
const String _tituloAppBar = "Nova Tarefa";

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}  ) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value){
    if(value != null && value.isEmpty){
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(_tituloAppBar),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 550,
              width: 375,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(color: Colors.black12, width: 3),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (valueValidator(value)){
                          return _mesagemTarefa;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Nome",
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: difficultyController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (valueValidator(value) ||
                            int.parse(value!) < 1 ||
                            int.parse(value) > 5) {
                          return _mesagemDifficulty;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Difficulty",
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: imageController,
                      keyboardType: TextInputType.url,
                      validator: (value) {
                        if (valueValidator(value)) {
                          return _mesagemUrl;
                        }
                        return null;
                      },
                      onChanged: (text) {
                        setState(() {});
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Image",
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 2, color: Colors.white12)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageController.text,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset("assets/images/nophoto.png");
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // utilizando metodo que adiciona a nova tarefa na lista
                          TaskInherited.of(widget.taskContext).newTask(
                              nameController.text,
                              imageController.text,
                              int.parse(difficultyController.text));

                          AnimatedSnackBar.material(
                            'Tarefa Salva',
                            type: AnimatedSnackBarType.success,
                            mobileSnackBarPosition:
                                MobileSnackBarPosition.bottom,
                            desktopSnackBarPosition:
                                DesktopSnackBarPosition.topRight,
                            duration: const Duration(milliseconds: 50),
                          ).show(context);

                          Navigator.pop(context);

                          /*      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Tarefa Salva",textAlign: TextAlign.center),
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0,
                                vertical: 8.0,
                            ),
                            behavior: SnackBarBehavior.floating,


                          ));*/
                        }
                      },
                      child: const Text("Print"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
