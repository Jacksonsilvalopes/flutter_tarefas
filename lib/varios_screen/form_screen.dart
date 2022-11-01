import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Nova Tarefa"),
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
                        if (value!.isEmpty) {
                          return "Digite a Tarefa";
                        }
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
                        if (value!.isEmpty ||
                            int.parse(value!) < 1 ||
                            int.parse(value!) > 5) {
                          return "Insira Difficult entre 1 a 5 ";
                        }
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
                        if (value!.isEmpty) {
                          return "Insira URL válida";
                        }
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
                          print(nameController.text);
                          print(difficultyController.text);
                          print(imageController.text);

                          AnimatedSnackBar.material(
                            'Tarefa Salva',
                            type: AnimatedSnackBarType.success,
                            mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                            desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
                            duration: const Duration(milliseconds: 50),
                          ).show(context);

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
