import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final Function callback;

  Answer(this.text, this.callback);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: this.callback,
          child: Text(this.text)),
    );
  }
}
