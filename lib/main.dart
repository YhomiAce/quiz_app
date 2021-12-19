import 'package:flutter/material.dart';

import './widgets/quiz.dart';
import './widgets/result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'question': "What is Your Favorite Food",
      "answers": [
        {'text': 'Rice', 'score': 5},
        {'text': 'Beans', 'score': 3},
        {'text': 'Yam', 'score': 7},
        {'text': 'Plantain', 'score': 10}
      ]
    },
    {
      'question': "What\'s Your Favorite Color",
      "answers": [
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 2},
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 1}
      ]
    },
    {
      'question': 'What is Your Favorite Animal',
      "answers": [
        {'text': 'Dog', 'score': 2},
        {'text': 'Cat', 'score': 3},
        {'text': 'Bird', 'score': 4},
        {'text': 'Wolf', 'score': 10}
      ]
    },
    {
      'question': 'Who is Your Favorite Superhero',
      "answers": [
        {'text': 'Spiderman', 'score': 4},
        {'text': 'Superman', 'score': 5},
        {'text': 'Ironman', 'score': 6},
        {'text': 'Batman', 'score': 8}
      ]
    },
    {
      'question': 'What is Your Favorite Anime',
      "answers": [
        {'text': 'Naruto', 'score': 5},
        {'text': 'One piece', 'score': 10},
        {'text': 'Bleach', 'score': 2},
        {'text': 'Fairy Tail', 'score': 4}
      ]
    },
  ];
  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // _totalScore = _totalScore + score;
    _totalScore += score;
    print('Answer Choosen');
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print("No More questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = ["Hello"];
    // dummy.add('Yomi');
    // print(dummy);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First Mobile App"),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  questionIndex: _questionIndex)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
