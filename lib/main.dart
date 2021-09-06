import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var question = [
    {
      "question": "Which is your favourite colour?",
      "answer": [
        {"text": "White", "score": 1},
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 6},
        {"text": "Green", "score": 4}
      ],
    },
    {
      "question": "Which is your favourite animal?",
      "answer": [
        {"text": "Panda", "score": 1},
        {"text": "Dog", "score": 4},
        {"text": "Cat", "score": 6},
        {"text": "Rabbit", "score": 2}
      ],
    },
    {
      "question": "Who is your favourite instructor?",
      "answer": [
        {"text": "Archi", "score": 1},
        {"text": "Ishika", "score": 1},
        {"text": "Manoj Kannan", "score": 10},
        {"text": "Rajdweep Choudhary", "score": 5}
      ],
    },
  ];

  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }
  void questionIndexIncrease(int score) {

    totalScore = totalScore + score;
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personality Test"),
        backgroundColor: Colors.blue[900],
      ),
      body: questionIndex < question.length
          ? Quiz(
              questionIndexIncrease: questionIndexIncrease,
              questionIndex: questionIndex,
              question: question)
          : Result(totalScore, resetQuiz),
    );
  }
}
