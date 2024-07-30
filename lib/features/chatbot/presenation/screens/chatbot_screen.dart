import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My ChatBot"),
      ),
      body: FutureBuilder(
        future: initialiseGemini(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const Center(
              child: Text("Oops an error has occurred"),
            );
          } else {
            return ChatBotPage();
          }
        },
      ),
    );
  }
}

Future<void> initialiseGemini() async {
  Gemini gemini = Gemini.instance;
  print(gemini);
}

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final ImagePicker picker = ImagePicker();
  final TextEditingController controller = TextEditingController();
  late final Gemini gemini;
  String? searchedText;
  String? result;
  bool isLoading = false;
  bool isTextWithImage = false;
  Uint8List? selectedImage;

  @override
  void initState() {
    super.initState();
    gemini = Gemini.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [],);
  }
}
