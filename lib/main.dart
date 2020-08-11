import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

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
  final _questions = const [
    {
      'question': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Gold', 'score': 8},
        {'text': 'Green', 'score': 6},
        {'text': 'Blue', 'score': 4},
      ],
    },
    {
      'question': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 4},
        {'text': 'Cat', 'score': 6},
        {'text': 'Parrot', 'score': 8},
        {'text': 'Sheep', 'score': 10},
      ],
    },
    {
      'question': 'Who\'s your daddy?',
      'answers': [
        {'text': 'Otedola', 'score': 6},
        {'text': 'Abubakar', 'score': 8},
        {'text': 'Obasanjo', 'score': 10},
        {'text': 'Adenuga', 'score': 4},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : Result(
                score: _totalScore,
                resetAction: _resetQuiz,
              ),
      ),
    );
  }
}
