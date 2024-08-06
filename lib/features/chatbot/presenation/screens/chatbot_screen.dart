import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_image.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My ChatBot"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("My chatty extra tutor packs can be here"),
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: initialiseGemini(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            ///todo: create an error page
            return const Center(
              child: Text("Oops, an error has occurred"),
            );
          } else {
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
  final ScrollController scrollController = ScrollController();
  final List<Message> msgs = [];
  bool isTyping = false;
  late final Gemini gemini;
  String? searchedText;
  String? result;
  bool isLoading = false;
  bool isTextWithImage = false;
  Uint8List? selectedImage;
  File? galleryFile;
  final snackBar = const SnackBar(
    content: Text("Something happened, please try again later"),
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
                          isTextWithImage
                              ? Column(
                                  children: [
                                    BubbleNormalImage(
                                      id: "1",
                                      image: _image(),
                                      sent: true,
                                      // trailing: Text(controller.text),
                                    ),
                                    BubbleNormal(
                                      text: msgs[0].msg,
                                      isSender: true,
                                      color: Colors.red.shade50,
                                      sent: true,
                                    ),
                                  ],
                                )
                              : BubbleNormal(
                                  text: msgs[0].msg,
                                  isSender: true,
                                  color: Colors.red.shade50,
                                  sent: true,
                                ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: BubbleNormal(
                                isSender: false,
                                text: "typing...",
                                color: Colors.grey.shade100,
                              ),
                            ),
                          )
                        ],
                      )
                    : BubbleNormal(
                        seen: msgs[index].isSender,
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
                onPressed: () {
                  isTextWithImage = true;
                  _showPicker(context);
                },
                icon: const Icon(
                  CupertinoIcons.add_circled_solid,
                  color: Colors.red,
                ),
              ),
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
                  isRed: true,
                ),
              ),
              isTextWithImage ? showSelectedImg() : const SizedBox(),
              IconButton(
                onPressed: sendMsg,
                icon: const Icon(
                  Icons.send,
                  color: Colors.red,
                ),
              )
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
        if (isTextWithImage && selectedImage != null) {
          sendMsgWithImage(text);
        } else {
          sendTextMsg(text);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
    }
  }

  void sendTextMsg(String text) {
    try {
      setState(() {
        msgs.insert(0, Message(true, text, false));
        isTyping = true;
        searchedText = text;
        controller.clear();
      });
      scrollController.animateTo(
        0.0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
      gemini.text(searchedText!).then((value) {
        setState(() {
          result = value?.content?.parts?.last.text;
          isTyping = false;
          msgs.insert(0, Message(false, result!, false));
          scrollController.animateTo(
            0.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
          );
        });
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void sendMsgWithImage(String text) {
    ///todo handle errors
    ///todo: api not working https://www.googlecloudcommunity.com/gc/AI-ML/image-processing-not-working-with-Gemini-API-text-working-fine/m-p/783615#M8418
    try {
      setState(() {
        msgs.insert(0, Message(true, text, true));
        isTyping = true;
        searchedText = text;
        controller.clear();
      });
      gemini.textAndImage(
        text: searchedText!,
        images: [selectedImage!],
      ).then((value) {
        setState(() {
          result = value?.content?.parts?.last.text;
          isTyping = false;
          msgs.insert(0, Message(false, result!, false));
          scrollController.animateTo(
            0.0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
          );
        });
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  getPicture();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text(Strings.photoLibrary),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.file_copy_outlined),
                title: const Text("File Library"),
                onTap: () {
                  getFile();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void getFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
  }

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        galleryFile = File(pickedFile.path);
        selectedImage = galleryFile!.readAsBytesSync();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(Strings.errorOccurred)),
        );
      }
    });
  }

  Future<void> getPicture() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      photo.readAsBytes().then((value) => selectedImage = value);
    }
  }

  Widget _image() {
    return Container(
      constraints: const BoxConstraints(minHeight: 20, minWidth: 20),
      child: galleryFile != null ? Image.file(galleryFile!) : const SizedBox(),
    );
  }

  Widget showSelectedImg() {
    if (galleryFile != null) {
      return Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Center(
              child: Image.file(galleryFile!),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  _showPicker(context);
                },
                icon: const Icon(
                  Icons.cancel,
                  size: 20,
                  color: Colors.red,
                ),
              ))
        ],
      );
    } else {
      ScaffoldMessenger(
        child: snackBar,
      );
    }
    return const SizedBox();
  }
}

class Message {
  final bool isSender;
  final String msg;
  final bool isImage;

  Message(this.isSender, this.msg, this.isImage);
}
