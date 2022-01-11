import 'package:flutter/material.dart';

import 'package:reminder/add_reminder.dart';
import 'package:reminder/home_page.dart';
import 'package:reminder/tabs_page.dart';
import 'package:reminder/quiz.dart';
import 'package:reminder/result.dart';
import 'package:reminder/tips_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "How much do you weigh?",
      'answers': [
        {'text': 'Less than 50kg', 'score': 50},
        {'text': 'Between 51kg to 100kg', 'score': 80},
        {'text': 'Between 101kg to 150kg', 'score': 100},
        {'text': 'Greater than 150kg', 'score': 120},
      ]
    },
    {
      'questionText': "What's your age?",
      'answers': [
        {'text': 'Less than 18', 'score': 40},
        {'text': 'Between 18 to 30', 'score': 40},
        {'text': 'Between 31 to 55', 'score': 35},
        {'text': 'Greater than 55', 'score': 30},
      ]
    },
    {
      'questionText': "What's the region in your region now?",
      'answers': [
        {'text': 'Hot', 'score': 3},
        {'text': 'Temperate', 'score': 2},
        {'text': 'Humid', 'score': 0},
        {'text': 'Cold', 'score': 0},
      ]
    },
    {
      'questionText': "How much do you exercise daily?",
      'answers': [
        {'text': 'Half an hour', 'score': 2},
        {'text': 'One hour', 'score': 3},
        {'text': 'Two hours', 'score': 7},
        {'text': 'More than two hours', 'score': 10},
      ]
    }
  ];
  var questionIndex = 0;
  var totalScore = 0;

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestions(int score) {
    totalScore += score;
    setState(() {
      questionIndex++;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue.shade800,
          title: Text('Water Drinking Reminder'),
        ),
        body: questionIndex < _questions.length
            ? Quiz(
                answerQuestions: answerQuestions,
                questionIndex: questionIndex,
                questions: _questions,
              )
            : Result(totalScore, _resetQuiz),
      ),
      routes: {
        TabPage.routeName: (context) => TabPage(),
        TipsPage.routeName: (context) => TipsPage(),
        HomePage.routeName: (context) => HomePage(),
        AddReminder.routeName: (context) => AddReminder(),
      },
    );
  }
}
