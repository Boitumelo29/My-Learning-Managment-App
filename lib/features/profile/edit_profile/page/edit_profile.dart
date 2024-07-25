import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final List<String> gender = [Strings.male, Strings.female];
  String selectedGender = Strings.maleC;
  File? galleryFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
      shouldBeCentered: false,
        title: Strings.editProfile,
        shouldScroll: true,
        shouldHaveFloatingButton: false,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                galleryFile == null
                    ? const Icon(
                        Icons.person,
                        size: 100,
                      )
                    : SizedBox(
                        height: 100,
                        width: 100,
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
                        Icons.camera,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ))
              ],
            ),
          ),
          const SizedSpace(),
          LongTextFieldForm(
            isRed: false,
            hintText: Strings.username,
            labelText: Strings.username,
            showPrefixIcon: true,
            onChanged: (value) {},
            showSuffixIcon: false,
            validator: (value) {},
            obsureText: false,
          ),
          const SizedSpace(),
          LongTextFieldForm(
            isRed: false,
            hintText: Strings.username,
            labelText: Strings.username,
            showPrefixIcon: true,
            onChanged: (value) {},
            showSuffixIcon: false,
            validator: (value) {},
            obsureText: false,
          ),
          const SizedSpace(),
          const Text(
              "The University would be placed here/// they can type it in"),
          Row(
            children: [
              Text("Your Gender: $selectedGender"),
              ElevatedButton(
                onPressed: () {
                  _showGender(context);
                },
                child: const Text(Strings.gender),
              ),
            ],
          ),
          const SizedSpace(),
          LongButton(onTap: () {}, title: Strings.save)
        ]);
  }

  void _showGender(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            child: CupertinoPicker(
              itemExtent: 32,
              onSelectedItemChanged: (int value) {
                setState(() {
                  selectedGender = gender[value];
                });
              },
              children: gender.map((String gender) {
                return Center(
                  child: Text(gender),
                );
              }).toList(),
            ),
          );
        });
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
                      Navigator.of(context).pop();
                    })
              ],
            )),
          );
        });
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
}
