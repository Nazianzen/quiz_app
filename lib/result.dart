import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetAction;

  Result({@required this.score, @required this.resetAction});

  String get resultPhrase {
    String resultText = 'Your score is $score.\n';
    if (score <= 12) {
      resultText += 'You are awesome and innocent!';
    } else if (score <= 18) {
      resultText += 'You are pretty likeable!';
    } else if (score <= 24) {
      resultText += 'You are strange!';
    } else {
      resultText += 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: resetAction,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
