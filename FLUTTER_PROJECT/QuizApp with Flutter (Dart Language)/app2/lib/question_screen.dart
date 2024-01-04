import 'package:flutter/material.dart';
import 'package:app2/answer_button.dart';
import 'package:app2/data/questions.dart';

class QuestionState extends StatefulWidget {
  const QuestionState({super.key, required this.onselectAnswers});

  final void Function(String answer) onselectAnswers;

  @override
  State<QuestionState> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<QuestionState> {
  var questionindex = 0;
  void questionnext(String answer) {
    widget.onselectAnswers(answer);
    setState(() {
      questionindex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[questionindex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(
                  answerText: item,
                  onTap: () {
                    questionnext(item);
                  });
            })
          ],
        ),
      ),
    );
  }
}
