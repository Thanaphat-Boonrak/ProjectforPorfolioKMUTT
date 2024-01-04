import 'package:app2/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:app2/fscreen.dart';
import 'package:app2/data/questions.dart';
import 'package:app2/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activescreen;
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescreen = ResultsScreen(
          answeruser: selectedAnswers,
          restartQuiz: restartQuiz,
        );
      });
    }
  }

  @override
  void initState() {
    activescreen = Fscreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activescreen = QuestionState(
        onselectAnswers: chooseAnswer,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activescreen = QuestionState(onselectAnswers: chooseAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.deepPurple,
            Colors.deepPurple,
          ])),
          child: activescreen,
        ),
      ),
    );
  }
}
