import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert with Spinner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showAlertWithSpinner(context);
              },
              child: Text('Show Alert'),
            ),
            SizedBox(height: 20),
            Text("Selected day: ${daysOfWeek[selectedIndex]}"),
          ],
        ),
      ),
    );
  }

  void showAlertWithSpinner(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        int tempSelectedIndex = selectedIndex;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Select a Day'),
              content: Container(
                height: 150,
                child: ListWheelScrollView(
                  itemExtent: 40,
                  useMagnifier: true,
                  magnification: 1.2,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      tempSelectedIndex = index;
                    });
                  },
                  children: daysOfWeek
                      .map((day) => Center(child: Text(day, style: TextStyle(fontSize: 18))))
                      .toList(),
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    setState(() {
                      selectedIndex = tempSelectedIndex;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
