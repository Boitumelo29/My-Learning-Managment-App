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
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: <Widget>[
                 const  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text('May 4th 2020'),
                    subtitle: Text('11:16 pm'),
                    // trailing: Icon(_isExpanded
                    //     ? Icons.expand_less
                    //     : Icons.expand_more),
                  ),
                  if (_isExpanded)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('TUESDAY'),
                          SizedBox(height: 8.0),
                          Text('0 Visitors'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
