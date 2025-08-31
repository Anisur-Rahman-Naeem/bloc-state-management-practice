import 'package:counter_app/bloc/todo/to_do_bloc.dart';
import 'package:counter_app/bloc/todo/to_do_bloc.dart';
import 'package:counter_app/bloc/todo/to_do_event.dart';
import 'package:counter_app/bloc/todo/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocBuilder<ToDoBloc, TodoState>(
        builder: (context, state) {
          if(state.todosList.isEmpty){
            return Center(child: Text('No todo found'),);
          }else if(state.todosList.isNotEmpty){
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todosList[index]),
                  trailing: IconButton(
                      icon: Icon(Icons.delete), onPressed: () {
                    context.read<ToDoBloc>().add(RemoveTodoEvent(task: state.todosList[index]));
                  }),
                );
              },
            );
          }else {
            return SizedBox();
          }

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for(int i = 0; i<10; i++){
            context.read<ToDoBloc>().add(AddTodoEvent(task: 'Task ' +i.toString()));
          }
        },
        child: Icon(Icons.add),),
    );
  }
}
