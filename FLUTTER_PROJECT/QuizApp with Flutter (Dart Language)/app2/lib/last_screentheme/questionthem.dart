import 'package:flutter/material.dart';

class ThemeQuestion extends StatelessWidget {
  const ThemeQuestion(
      {super.key, required this.correctAnswer, required this.indexquestion});

  final int indexquestion;
  final bool correctAnswer;

  @override
  Widget build(BuildContext context) {
    final questionnumber = indexquestion + 1;
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: correctAnswer ? Colors.blue : Colors.pink,
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        questionnumber.toString(),
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
