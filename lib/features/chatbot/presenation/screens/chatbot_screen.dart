import 'dart:ffi';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';


/// todo: now we focus on this:https://www.geeksforgeeks.org/how-to-create-a-chatbot-application-using-chatgpt-api-in-flutter/?ref=header_search
/// todo text to speech. https://pub.dev/packages/flutter_tts
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
            print("waiting");
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print("error");
            return const Center(
              child: Text("Oops an error has occurred"),
            );
          } else {
            print("success");
            // return Container(
            //   child: Column(children: [Text("Testing Testing")],),
            // );
            return const Center(child: ChatBotScreen());
          }
        },
      ),
    );
  }
}

Future<void> initialiseGemini() async {
  Gemini gemini = Gemini.instance;
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
    return Column(
      children: [
        if (searchedText != null)
          MaterialButton(
            onPressed: () {
              setState(() {
                searchedText = null;
                result = null;
              });
            },
            color: Colors.red,
            child: Text(
              "Search: $searchedText",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : result != null
                          ? Markdown(
                              data: result!,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                            )
                          : const Center(
                              child: Text("Search Something"),
                            ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: LongTextFieldForm(
                  controller: controller,
                    onChanged: (value) {},
                    hintText: "Enter something",
                    labelText: "Enter something",
                    showSuffixIcon: false,
                    showPrefixIcon: false,
                    validator: (value) {},
                    obsureText: false,
                    isRed: true),
              ),
              IconButton(
                  onPressed: () {
                    try {
                      if (controller.text.isNotEmpty) {
                        setState(() {
                          ///todo, this is how you set the data of the controller
                          searchedText = controller.text;
                          controller.clear();
                          isLoading = true;
                        });
                        gemini.text(searchedText!).then((value) {
                          setState(() {
                            print(value?.content?.parts?.length.toString());
                            result = value?.content?.parts?.last.text;
                            isLoading = false;
                          });
                        });
                      }else{
                        print("@@@@@@@@@ error");
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.red,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
