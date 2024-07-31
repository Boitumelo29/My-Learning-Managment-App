import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Divider Example')),
        body: Column(
          children: <Widget>[
            ListTile(
              title: Text('Item 1'),
            ),
            Divider(
              color: Colors.grey, // Color of the divider
              height: 20, // Space around the divider
              thickness: 2, // Thickness of the line
              indent: 15, // Starting space before the divider
              endIndent: 15, // Ending space after the divider
            ),
            ListTile(
              title: Text('Item 2'),
            ),
            Divider(),
            ListTile(
              title: Text('Item 3'),
            ),
          ],
        ),
      ),
    );
  }
}
