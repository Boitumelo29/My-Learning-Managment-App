class Question {
  String questionText;
  List<String> options;
  int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}


List<Question> questions = [
  Question(
    questionText: "What is the capital of France?",
    options: ["Berlin", "Madrid", "Paris", "Lisbon"],
    correctAnswerIndex: 2,
  ),
  Question(
    questionText: "Which language is used for Flutter development?",
    options: ["Java", "Kotlin", "Dart", "Swift"],
    correctAnswerIndex: 2,
  ),
  Question(
    questionText: "What is the capital of France?",
    options: ["Berlin", "Madrid", "Paris", "Lisbon"],
    correctAnswerIndex: 2,
  ),
  Question(
    questionText: "What is the capital of France?",
    options: ["Berlin", "Madrid", "Paris", "Lisbon"],
    correctAnswerIndex: 2,
  ),
];
