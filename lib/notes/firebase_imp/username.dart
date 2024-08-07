import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _saveUsername(String username) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add({
      'username': username,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Username to Firebase'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Enter Username',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                if (username.isNotEmpty) {
                  _saveUsername(username);
                }
              },
              child: Text('Save Username'),
            ),
          ],
        ),
      ),
    );
  }
}
