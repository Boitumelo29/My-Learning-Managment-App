import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:mylearning/features/my_study/features/flash_cards/data/model/flashcard.dart';

class FlashCardScreen extends StatefulWidget {
  const FlashCardScreen({super.key});

  @override
  State<FlashCardScreen> createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  final Box<FlashCard> flashCardBox = Hive.box<FlashCard>('flashcards');
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Add Flash Card'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: questionController,
                        decoration: InputDecoration(labelText: 'Question'),
                      ),
                      TextField(
                        controller: answerController,
                        decoration: InputDecoration(labelText: 'Answer'),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Add'),
                      onPressed: () {
                        addFlashCard(
                          questionController.text,
                          answerController.text,
                        );
                        questionController.clear();
                        answerController.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        title: Text('Flash Cards'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Add Flash Card'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: questionController,
                          decoration: InputDecoration(labelText: 'Question'),
                        ),
                        TextField(
                          controller: answerController,
                          decoration: InputDecoration(labelText: 'Answer'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Add'),
                        onPressed: () {
                          addFlashCard(
                            questionController.text,
                            answerController.text,
                          );
                          questionController.clear();
                          answerController.clear();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: flashCardBox.listenable(),
        builder: (context, Box<FlashCard> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text('No flash cards available'),
            );
          }

          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: box.length,
            itemBuilder: (context, index) {
              final flashCard = box.getAt(index);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: FlashCardWidget(
                    text: flashCard!.question,
                    color: Colors.blue,
                    label: 'Question',
                  ),
                  back: FlashCardWidget(
                    text: flashCard.answer,
                    color: Colors.green,
                    label: 'Answer',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void addFlashCard(String question, String answer) {
    final flashCard = FlashCard(question: question, answer: answer);
    flashCardBox.add(flashCard);
  }

  void deleteFlashCard(int index) {
    flashCardBox.deleteAt(index);
  }
}

class FlashCardWidget extends StatelessWidget {
  final String text;
  final Color color;
  final String label;

  FlashCardWidget({
    required this.text,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void shoDialog() {}
}
