import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('myBox'); // Open a Hive box
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bio App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BioScreen(),
    );
  }
}

class BioScreen extends StatefulWidget {
  @override
  _BioScreenState createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  final TextEditingController _controller = TextEditingController();
  late Box box;

  @override
  void initState() {
    super.initState();
    box = Hive.box('myBox'); // Reference the opened box
    _controller.text = box.get('bio', defaultValue: ''); // Load the saved bio
  }

  void _saveBio() {
    box.put('bio', _controller.text); // Save the bio
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Bio saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Bio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Add a bio',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveBio,
              child: Text('Save'),
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.red, // Button color
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
