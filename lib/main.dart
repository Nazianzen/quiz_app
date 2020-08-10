import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      if (_questionIndex == 0) {
        _questionIndex = 1;
      } else {
        _questionIndex = 0;
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'question': 'What\'s your favorite color?',
        'answers': ['Black', 'Gold', 'Green', 'Black'],
      },
      {
        'question': 'What\'s your favorite animal?',
        'answers': ['Dog', 'Cat', 'Parrot', 'Sheep'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Question(_questions[_questionIndex]['question']),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ...(_questions[_questionIndex]['answers'] as List<String>)
                    .map((answer) {
                  return Answer(
                    action: _answerQuestion,
                    buttonText: answer,
                  );
                }).toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}
