import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.blue.shade800,
        ),
        width: double.infinity,
        child: RaisedButton(
          color: Colors.blue.shade800,
          textColor: Colors.white,
          child: Text(answerText),
          onPressed: selectHandler,
        ),
      ),
    );
  }
}
