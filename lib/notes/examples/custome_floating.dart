import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Floating Action Buttons',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Floating Action Buttons'),
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
                    CustomFloatingButton(
                      icon: Icons.add,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                    ),
                    CustomFloatingButton(
                      icon: Icons.remove,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                    ),
                    CustomFloatingButton(
                      icon: Icons.place,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                    ),
                    CustomFloatingButton(
                      icon: Icons.home,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
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

class CustomFloatingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  CustomFloatingButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
