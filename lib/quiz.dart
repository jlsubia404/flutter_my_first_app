import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIdx;
  final Function callback;
  Quiz(
      {@required this.questions,
      @required this.questionIdx,
      @required this.callback});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(this.questions[this.questionIdx]['questionText']),
        ...(this.questions[this.questionIdx]['answers']
                as List<Map<String, Object>>)
            .map((answer) => new Answer(
                answer['text'], () => this.callback(answer["score"])))
      ],
    );
  }
}
