import 'package:app2/data/questions.dart';
import 'package:app2/last_screentheme/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.answeruser, required this.restartQuiz});

  final List<String> answeruser;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < answeruser.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': answeruser[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalquestion = questions.length;
    final numCorrectQuestion = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
              "You answered $numCorrectQuestion out of $numTotalquestion questions correctly",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: Icon(Icons.refresh_outlined),
              label: const Text("restart Quiz"))
        ]),
      ),
    );
  }
}
