import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(index.toString()),
            trailing: IconButton(icon: Icon(Icons.delete), onPressed: () {}),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
      child: Icon(Icons.add),),
    );
  }
}
