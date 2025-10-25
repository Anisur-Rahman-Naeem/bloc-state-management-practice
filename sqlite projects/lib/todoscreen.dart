import 'package:flutter/material.dart';
import 'package:intro_to_sqlite/databaseHelper.dart';
import 'package:intro_to_sqlite/task.dart';
import 'package:sqflite/sqflite.dart';

class Todoscreen extends StatefulWidget {
  const Todoscreen({super.key});

  @override
  State<Todoscreen> createState() => _TodoscreenState();
}

class _TodoscreenState extends State<Todoscreen> {
  TextEditingController _taskController = TextEditingController();
  List<Task> _tasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasksData = await DatabaseHelper.instance.getTask();
    setState(() {
      _tasks = tasksData.map((task) => Task.fromMap(task)).toList();
    });
  }

  Future<void> _addTasks() async {
    if (_taskController.text.isNotEmpty) {
      await DatabaseHelper.instance.insertTask({
        'title': _taskController.text,
        'isCompleted': 0,
      });
      _taskController.clear();
      _loadTasks();
    }
  }

  Future<void> _toggleTaskCompletion(Task task) async {
    await DatabaseHelper.instance.updateTask(
      task.id!,
      task.isCompleted == 1 ? 0 : 1,
    );
    _loadTasks();
  }

  Future<void> _deleteTask(int id) async {
    await DatabaseHelper.instance.deleteTask(id);
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite To-Do App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(labelText: 'Enter Task'),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _addTasks();
                  },
                  icon: Icon(Icons.add, color: Colors.blue),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () => _toggleTaskCompletion(task),
                        icon: Icon(
                          task.isCompleted == 1
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: Colors.green,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _deleteTask(_tasks[index].id!);
                        },
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
