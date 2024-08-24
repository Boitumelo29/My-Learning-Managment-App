import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mylearning/notes/hive/user.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box<User> userBox;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  User? savedUser;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    userBox = await Hive.openBox<User>('userBox');
    _loadUser();
  }

  void _loadUser() {
    setState(() {
      savedUser = userBox.get('user');
    });
  }

  void _addUser() async {
    final newUser = User(
      email: emailController.text,
      username: usernameController.text,
    );
    await userBox.put('user', newUser);
    _loadUser();
    emailController.clear();
    usernameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addUser,
              child: Text('Add User'),
            ),
            SizedBox(height: 16),
            if (savedUser != null) ...[
              Text(
                'Saved User Details:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Email: ${savedUser!.email}'),
              Text('Username: ${savedUser!.username}'),
            ]
          ],
        ),
      ),
    );
  }
}