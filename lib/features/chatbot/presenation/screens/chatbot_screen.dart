import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

/// todo: now we focus on this:https://www.geeksforgeeks.org/how-to-create-a-chatbot-application-using-chatgpt-api-in-flutter/?ref=header_search
/// todo text to speech. https://pub.dev/packages/flutter_tts
/// todo: https://media.geeksforgeeks.org/wp-content/cdn-uploads/20211007220233/text_to_speech_flutter-master.zip
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
  ScrollController scrollController = ScrollController();
  List<Message> msgs = [];
  bool isTyping = false;
  late final Gemini gemini;
  String? searchedText;
  String? result;
  bool isLoading = false;
  bool isTextWithImage = false;
  Uint8List? selectedImage;
  File? galleryFile;
  var snackBar = const SnackBar(
    content: Text("Something happened please try again later"),
  );

  @override
  void initState() {
    super.initState();
    gemini = Gemini.instance;
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Column(
      children: [
        DateChip(
          date: DateTime(now.year, now.month, now.day - 2),
        ),
        galleryFile == null
            ? SizedBox()
            : BubbleNormalImage(
          id: "1",
          image: _image(),
        ),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: msgs.length,
            shrinkWrap: true,
            reverse: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: isTyping && index == 0
                    ? Column(
                  children: [
                    BubbleNormal(
                      text: msgs[0].msg,
                      isSender: true,
                      color: Colors.red.shade50,
                      sent: true,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Typing"),
                      ),
                    )
                  ],
                )
                    : BubbleNormal(

                  ///todo: what did you do here
                  seen: msgs[index].isSender ? true : false,
                  text: msgs[index].msg,
                  isSender: msgs[index].isSender,
                  color: msgs[index].isSender
                      ? Colors.red.shade100
                      : Colors.grey.shade100,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () => _showPicker(context),
                  icon: const Icon(
                    CupertinoIcons.add_circled_solid,
                    color: Colors.red,
                  )),
              // IconButton(
              //     onPressed: () {},
              //     icon: const Icon(
              //       Icons.keyboard_voice,
              //       color: Colors.red,
              //     )),
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
                    sendMsg();
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

  void sendMsg() {
    String text = controller.text;
    try {
      if (text.isNotEmpty) {
        setState(() {
          ///todo, this is how you set the data of the controller
          msgs.insert(0, Message(true, text));
          isTyping = true;
          searchedText = text;
          controller.clear();
          //isLoading = true;
        });
        scrollController.animateTo(0.0,
            duration: const Duration(seconds: 1), curve: Curves.easeOut);
        gemini.text(searchedText!).then((value) {
          setState(() {
            print(value?.content?.parts?.length.toString());
            result = value?.content?.parts?.last.text;
            isTyping = false;
            msgs.insert(0, Message(false, result!));
            scrollController.animateTo(0.0,
                duration: const Duration(seconds: 1), curve: Curves.easeOut);
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      var snackBar = SnackBar(
        content: Text("$e"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void sendMsgImg() {
    // gemini.textAndImage(text: controller.text, images: [selectedImage!]);

    String text = controller.text;
    try {
      if (text.isNotEmpty) {

      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

void _showPicker(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: (Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text(Strings.photoLibrary),
                  onTap: () {
                    getImage(ImageSource.gallery);
                    sendMsgImg();
                    Navigator.of(context).pop();
                  }),
              ListTile(
                  leading: const Icon(Icons.file_copy_outlined),
                  title: const Text("file library"),
                  onTap: () {
                    getFile();
                    Navigator.of(context).pop();
                  }),
            ],
          )),
        );
      });
}

void getFile() async {
  final result = await FilePicker.platform.pickFiles(allowMultiple: false);

  if (result == null) return;
}

Future getImage(ImageSource img) async {
  final pickedFile = await picker.pickImage(source: img);
  XFile? xFilePick = pickedFile;
  setState(() {
    if (xFilePick != null) {
      galleryFile = File(pickedFile!.path);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text(Strings.errorOccurred)));
    }
  });
}

Widget _image() {
  return Container(
    constraints: const BoxConstraints(minHeight: 20, minWidth: 20),
    child: Image.file(galleryFile!),
  );
}}

class Message {
  bool isSender;
  String msg;

  Message(this.isSender, this.msg);
}
