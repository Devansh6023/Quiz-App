import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function questionIndexIncrease;

  Quiz(
      {@required this.question,
        @required this.questionIndexIncrease,
        @required this.questionIndex
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Question(
          question[questionIndex]['question'],
        ),
        ...(question[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => questionIndexIncrease(answer["score"]), answer["text"]);
        }).toList()
      ],
    );
  }
}
