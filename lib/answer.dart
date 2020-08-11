import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String buttonText;
  final Function action;

  Answer({@required this.buttonText, @required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(buttonText),
        onPressed: action,
      ),
    );
  }
}
