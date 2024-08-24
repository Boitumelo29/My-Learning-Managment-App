import 'package:flutter/material.dart';

class TrueOrFalse extends StatefulWidget {
  @override
  _TrueOrFalseState createState() => _TrueOrFalseState();
}

class _TrueOrFalseState extends State<TrueOrFalse> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;

  List<Question> _questions = [
    Question('The sky is blue.', true),
    Question('Cats can fly.', false),
    Question('Flutter is developed by Google.', true),
  ];

  void _answerQuestion(bool answer) {
    if (answer == _questions[_currentQuestionIndex].isTrue) {
      _score++;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Correct!'),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wrong!'),
          duration: Duration(seconds: 1),
        ),
      );
    }

    setState(() {
      _currentQuestionIndex++;
      if (_currentQuestionIndex >= _questions.length) {
        _quizCompleted = true;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("True or False"),),
      body: Center(
        child: _quizCompleted
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           const Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Your Score: $_score/${_questions.length}',
              style: TextStyle(fontSize: 20.0),
            ),
           const  SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _resetQuiz,
              child: const Text('Restart Quiz'),
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _questions[_currentQuestionIndex].text,
              style:const TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _answerQuestion(true),
                  child: Text('True'),
                ),
                ElevatedButton(
                  onPressed: () => _answerQuestion(false),
                  child: Text('False'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Score: $_score/${_questions.length}',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final bool isTrue;

  Question(this.text, this.isTrue);
}