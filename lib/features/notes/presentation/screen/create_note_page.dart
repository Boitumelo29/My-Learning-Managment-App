import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/widgets/containers/about_bio_container.dart';
import 'package:mylearning/util/validation/validation.dart';

class NotesScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text("Add notes"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.grey),
                hintText: 'add name',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            AboutBioContainer(
                controller: controller,
                validator: (value) {
                  return Validation.textValidation(value);
                }),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.grey),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15),
                child: Text(
                  'Add note',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
