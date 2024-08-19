import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('tasksBox'); // Open a box named 'tasksBox'
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Example',
      home: TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TextEditingController _taskController = TextEditingController();
  final Box taskBox = Hive.box('tasksBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Task List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: taskBox.listenable(),
              builder: (context, Box box, widget) {
                if (box.values.isEmpty) {
                  return Center(
                    child: Text('No tasks added yet!'),
                  );
                }

                return ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    final task = box.getAt(index);
                    return ListTile(
                      title: Text(task),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          box.deleteAt(index);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: 'Enter a new task',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    final task = _taskController.text;
                    if (task.isNotEmpty) {
                      taskBox.add(task);
                      _taskController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }
}
