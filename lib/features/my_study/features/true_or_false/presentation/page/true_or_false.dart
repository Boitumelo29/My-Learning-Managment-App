import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/features/my_study/features/true_or_false/model/true_or_false_model.dart';

class TrueOrFalsePage extends StatefulWidget {
  const TrueOrFalsePage({super.key});

  @override
  State<TrueOrFalsePage> createState() => _TrueOrFalsePageState();
}

class _TrueOrFalsePageState extends State<TrueOrFalsePage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;

  final List<TrueOrFalseModel> _questions = [
    TrueOrFalseModel('The sky is blue.', true),
    TrueOrFalseModel('Cats can fly.', false),
    TrueOrFalseModel('Flutter is developed by Google.', true),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
      shouldScroll: false,
      title: "True Or False",
      shouldHaveFloatingButton: false,
      shouldBeCentered: true,
      children: [
        Center(
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
                    const SizedBox(height: 20.0),
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
                      style: const TextStyle(fontSize: 24.0),
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
        )
      ],
    );
  }

  void _answerQuestion(bool answer) {
    if (answer == _questions[_currentQuestionIndex].isTrue) {
      _score++;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Correct!'),
          duration: Duration(seconds: 1),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wrong!'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
    });
  }
}
