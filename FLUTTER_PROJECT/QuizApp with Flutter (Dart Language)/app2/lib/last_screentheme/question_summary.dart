import 'package:flutter/material.dart';
import 'package:app2/last_screentheme/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summarydata, {super.key});

  final List<Map<String, Object>> summarydata;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((data) {
            return SummaryItem(
              itemData: data,
            );
          }).toList(),
        ),
      ),
    );
  }
}
