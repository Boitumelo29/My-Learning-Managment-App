import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mylearning/common_widgets/screens/appBar_layout/app_bar_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/common_widgets/widgets/containers/about_bio_container.dart';
import 'package:mylearning/common_widgets/widgets/containers/edit_profile_container.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  //final Box bioBox = Hive.box("bioBox");
  late Box box;
  TextEditingController controller = TextEditingController();
  final List<String> gender = [Strings.male, Strings.female];
  String selectedGender = Strings.maleC;
  File? galleryFile;
  final picker = ImagePicker();
  User? user;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    box = Hive.box('myBox');
    controller.text = box.get("bio", defaultValue: '');
  }

  @override
  Widget build(BuildContext context) {
    return AppBarScreen(
        shouldBeCentered: true,
        title: Strings.editProfile,
        shouldScroll: true,
        shouldHaveFloatingButton: false,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Edit your Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.drive_file_rename_outline)
            ],
          ),
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
          EditProfileContainer(
              onTap: () {
                userName();
              },
              icon: Icons.person,
              title: "Username"),
          const SizedSpace(),
          EditProfileContainer(
              onTap: () {
                email();
              },
              icon: Icons.email,
              title: user?.email ?? ""),
          const SizedBox(
            height: 15,
          ),
          EditProfileContainer(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2101));
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              icon: Icons.calendar_month,
              title: "Add a date of birth"),
          const SizedBox(
            height: 15,
          ),
          AboutBioContainer(
            controller: controller,
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
              width: 330,
              child: LongButton(
                  isLoading: false,
                  onTap: () {
                    _saveBio();
                  },
                  title: Strings.save),),

        ]);
  }

  void _saveBio(){
    box.put('bio', controller.text);
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

  userName() {
    TextEditingController userName = TextEditingController();
    bool isLoading = false;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 230,
            width: 480,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text("Update Username",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),
                const SizedBox(
                  height: 20,
                ),
                LongTextFieldForm(
                  controller: userName,
                  onChanged: (value) {},
                  hintText: "Username",
                  labelText: "username",
                  showSuffixIcon: false,
                  showPrefixIcon: true,
                  prefixIcon: Icons.person,
                  validator: (value) {},
                  obsureText: false,
                  isRed: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                LongButton(
                    isLoading: isLoading,
                    onTap: () async {},
                    title: "Update Username"),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  email() {
    TextEditingController email = TextEditingController();
    bool isLoading = false;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 230,
            width: 480,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text("Update Email",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),
                const SizedBox(
                  height: 20,
                ),
                LongTextFieldForm(
                  controller: email,
                  onChanged: (value) {},
                  hintText: "Email",
                  labelText: "Email",
                  showSuffixIcon: false,
                  showPrefixIcon: true,
                  prefixIcon: Icons.email,
                  validator: (value) {},
                  obsureText: false,
                  isRed: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                LongButton(
                    isLoading: isLoading,
                    onTap: () async {},
                    title: "Update Email"),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
