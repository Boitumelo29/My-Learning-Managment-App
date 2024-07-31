import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

// void main() {
//   Gemini.init(apiKey: "AIzaSyCvFjc2RVFJv6V22IAnzHgPjx5aj8_LCgg");
//   runApp(const MyApp());
// }

class MyChatApp extends StatelessWidget {
  const MyChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: initializeGemini(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error initializing Gemini'));
          } else {
            return const MyGeminiSearchScreen();
          }
        },
      ),
    );
  }

  Future<void> initializeGemini() async {
    // Add your initialization logic here
    // For example, if there's any async setup, do it here
    Gemini gemini = Gemini.instance;
  }
}

class MyGeminiSearchScreen extends StatefulWidget {
  const MyGeminiSearchScreen({super.key});

  @override
  State<MyGeminiSearchScreen> createState() => _MyGeminiSearchScreenState();
}

class _MyGeminiSearchScreenState extends State<MyGeminiSearchScreen> {
  final ImagePicker picker = ImagePicker();
  final controller = TextEditingController();
  late final Gemini gemini;
  String? searchedText, result;

  bool loading = false;
  bool isTextWithImage = false;
  Uint8List? selectedImage;

  @override
  void initState() {
    super.initState();
    // Initialize Gemini instance
    gemini = Gemini.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Gemini"),
      ),
      body: Column(
        children: [
          // Radio to select between different type of search
          Row(
            children: [
              Radio(
                value: false,
                groupValue: isTextWithImage,
                onChanged: (val) {
                  setState(() {
                    isTextWithImage = val ?? false;
                  });
                },
              ),
              const Text("Search with Text"),
              Radio(
                value: true,
                groupValue: isTextWithImage,
                onChanged: (val) {
                  setState(() {
                    isTextWithImage = val ?? false;
                  });
                },
              ),
              const Text("Search with Text and Image")
            ],
          ),
          // To show text that we have search for
          if (searchedText != null)
            MaterialButton(
              color: Colors.green.shade200,
              onPressed: () {
                setState(() {
                  searchedText = null;
                  result = null;
                });
              },
              child: Text(
                'Search: $searchedText',
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
                    flex: 2,
                    // Loader when gemini is searching for result
                    child: loading
                        ? const Center(child: CircularProgressIndicator())
                        : result != null
                        ? Markdown(
                      data: result!,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12),
                    )
                        : const Center(
                      child: Text('Search something!'),
                    ),
                  ),
                  if (selectedImage != null)
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.memory(
                          selectedImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      hintText: 'Write Something...',
                      border: InputBorder.none,
                    ),
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                  ),
                ),
                if (isTextWithImage)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    // Select image from device
                    child: IconButton(
                      onPressed: () async {
                        final XFile? photo = await picker.pickImage(
                            source: ImageSource.camera);

                        if (photo != null) {
                          photo.readAsBytes().then((value) => setState(() {
                            selectedImage = value;
                          }));
                        }
                      },
                      icon: const Icon(Icons.file_copy_outlined),
                    ),
                  ),
                // Send the typed the search to gemini
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        if (isTextWithImage) {
                          if (selectedImage != null) {
                            setState(() {
                              searchedText = controller.text;
                              controller.clear();
                              loading = true;
                            });
                            gemini
                                .textAndImage(
                              text: searchedText!,
                              images: [selectedImage!], // Pass as a list
                            )
                                .then((value) {
                              setState(() {
                                result = value?.content?.parts?.last.text;
                                loading = false;
                              });
                            });
                          } else {
                            // Fluttertoast.showToast(
                            //     msg: "Please select picture");
                          }
                        } else {
                          setState(() {
                            searchedText = controller.text;
                            controller.clear();
                            loading = true;
                          });
                          gemini.text(searchedText!).then((value) {
                            setState(() {
                              print(value?.content?.parts?.length.toString());
                              result = value?.content?.parts?.last.text;
                              loading = false;
                            });
                          });
                        }
                      } else {
                        // Fluttertoast.showToast(msg: "Please enter something");
                      }
                    },
                    icon: const Icon(Icons.send_rounded),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

