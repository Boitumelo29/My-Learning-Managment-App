import 'package:flutter/material.dart';
import 'package:mylearning/features/my_study/features/multiple_choice/model/multiple_choice_question.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].correctAnswerIndex) {
      setState(() {
        score++;
      });
    }

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        _showResultDialog();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].questionText,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ...questions[currentQuestionIndex].options.map((option) {
              int index =
                  questions[currentQuestionIndex].options.indexOf(option);
              return ElevatedButton(
                child: Text(option),
                onPressed: () => _answerQuestion(index),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Quiz Finished!'),
        content: Text('Your score is $score/${questions.length}'),
        actions: [
          TextButton(
            child: Text('Restart'),
            onPressed: () {
              setState(() {
                currentQuestionIndex = 0;
                score = 0;
              });
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
}
