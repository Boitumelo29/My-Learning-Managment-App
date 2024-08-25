import 'package:hive/hive.dart';

part 'flashcard.g.dart';
@HiveType(typeId: 1)
class FlashCard {
  @HiveField(0)
  final String question;

  @HiveField(1)
  final String answer;

  FlashCard({required this.question, required this.answer});
}

