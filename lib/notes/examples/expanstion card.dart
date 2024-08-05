import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expandable Card Example'),
        ),
        body: ExpandableCard(),
      ),
    );
  }
}

class ExpandableCard extends StatefulWidget {
  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: _isExpanded ? 200.0 : 100.0, // Adjust height based on _isExpanded
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'May 4th 2020',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      '11:16 pm',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                if (_isExpanded)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(color: Colors.white),
                        Row(
                          children: [
                            Icon(Icons.wb_sunny, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'TUESDAY',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.people, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              '0 Visitors',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
