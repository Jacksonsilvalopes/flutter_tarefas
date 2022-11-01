import 'package:flutter/material.dart';


class Difficult extends StatelessWidget {
  final int dificultLevel;
  final String tarefaLevel;
  const Difficult({ Key? key, required this.dificultLevel, required this.tarefaLevel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: Text(
            tarefaLevel,
            style: const TextStyle(fontSize: 20, overflow: TextOverflow.ellipsis),
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              size: 15,
              color: (dificultLevel >= 1) ? Colors.blue : Colors.blue[100],
            ),
            Icon(
              Icons.star,
              size: 15,
              color: (dificultLevel >= 2) ? Colors.blue : Colors.blue[100],
            ),
            Icon(
              Icons.star,
              size: 15,
              color: (dificultLevel >= 3) ? Colors.blue : Colors.blue[100],
            ),
            Icon(
              Icons.star,
              size: 15,
              color: (dificultLevel >= 4) ? Colors.blue : Colors.blue[100],
            ),
            Icon(
              Icons.star,
              size: 15,
              color: (dificultLevel >= 5) ? Colors.blue : Colors.blue[100],
            ),
          ],
        ),
      ],
    );
  }
}