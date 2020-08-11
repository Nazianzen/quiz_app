import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(questions[questionIndex]['question']),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...(questions[questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map((answer) {
              return Answer(
                action: () => answerQuestion(answer['score']), 
                buttonText: answer['text'],
              );
            }).toList()
          ],
        )
      ],
    );
  }
}
