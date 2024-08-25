import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/widgets/containers/true_or_false_container.dart';
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

  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
      shouldScroll: false,
      title: "True Or False",
      shouldHaveFloatingButton: true,
      tooltip: "Question",
      icon: Icons.add,
      shouldBeCentered: true,
      children: [
        _quizCompleted
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
                    style: const TextStyle(fontSize: 20.0),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Text(
                    _questions[_currentQuestionIndex].text,
                    style: const TextStyle(fontSize: 24.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 200.0),
                  TrueOrFalseContainer(
                      shouldBeRed: false,
                      onTap: () {
                        _answerQuestion(true);
                      },
                      shouldBeTrue: true),
                  const SizedBox(height: 20.0),
                  TrueOrFalseContainer(
                      shouldBeRed: true,
                      onTap: () {
                        _answerQuestion(false);
                      },
                      shouldBeTrue: false),
                  const SizedBox(height: 120.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: scoreKeeper,
                  ),
                ],
              )
      ],
    );
  }

  void _answerQuestion(bool answer) {
    setState(() {
      if (answer == _questions[_currentQuestionIndex].isTrue) {
        _score++;
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _quizCompleted = true;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(answer == _questions[_currentQuestionIndex].isTrue
              ? 'Wrong!'
              : 'Correct!'),
          duration: const Duration(seconds: 3),
          backgroundColor: answer == _questions[_currentQuestionIndex].isTrue
              ? Colors.red
              : Colors.green,
        ),
      );
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
      scoreKeeper = [];
    });
  }
}
