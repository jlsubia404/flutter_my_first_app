import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const questions = [
    {
      "questionText": "WHat's your favourite Color",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1},
      ]
    },
    {
      "questionText": "What's your favourite animal",
      "answers": [
        {"text": "Rabbit", "score": 4},
        {"text": "Snake", "score": 9},
        {"text": "Elephant", "score": 10},
        {"text": "Lion", "score": 3},
      ]
    },
    {
      "questionText": "Who's your favorite instructor",
      "answers": [
        {"text": "Max", "score": 3},
        {"text": "Max", "score": 2},
        {"text": "Max", "score": 4},
        {"text": "Max", "score": 5},
      ]
    }
  ];

  var _questionIdx = 0;
  var _totalScore = 0;
  void _restartQuiz() {
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
    });
  }

  void _answerChosen(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIdx++;
    });
    print(_questionIdx);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("title"),
        ),
        body: _questionIdx < questions.length
            ? Quiz(
                questions: questions,
                questionIdx: _questionIdx,
                callback: _answerChosen)
            : Result(_totalScore, _restartQuiz),
      ),
    );
  }
}
