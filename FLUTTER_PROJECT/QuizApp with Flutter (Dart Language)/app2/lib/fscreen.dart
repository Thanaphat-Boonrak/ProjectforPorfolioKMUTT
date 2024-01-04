import 'package:flutter/material.dart';

class Fscreen extends StatelessWidget {
  const Fscreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(height: 80),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
                fontSize: 22, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
            icon: const Icon(Icons.arrow_right),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
