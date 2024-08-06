import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Action Buttons',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Floating Action Buttons'),
        ),
        body: Stack(
          children: [
            Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter something',
                  contentPadding: EdgeInsets.all(16.0),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: Icon(Icons.add),
                      backgroundColor: Colors.green,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: Icon(Icons.remove),
                      backgroundColor: Colors.green,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: Icon(Icons.place),
                      backgroundColor: Colors.green,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: Icon(Icons.home),
                      backgroundColor: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
