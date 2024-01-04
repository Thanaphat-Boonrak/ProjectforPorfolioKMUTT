import 'package:flutter/material.dart';
import 'package:app2/last_screentheme/questionthem.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemData});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData["user_answer"] == itemData["correct_answer"];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ThemeQuestion(
            correctAnswer: isCorrectAnswer,
            indexquestion: itemData['question_index'] as int),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(itemData['question'] as String,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 5,
            ),
            Text(
              itemData['user_answer'] as String,
              style: const TextStyle(color: Color.fromARGB(255, 202, 75, 118)),
            ),
            Text(
              itemData['correct_answer'] as String,
              style: const TextStyle(color: Colors.blue),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ))
      ],
    );
  }
}
