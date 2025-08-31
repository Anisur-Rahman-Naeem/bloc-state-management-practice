import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/todo/to_do_event.dart';
import 'package:counter_app/bloc/todo/to_do_state.dart';

class ToDoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];
  ToDoBloc() : super(const TodoState()){
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

  void _addTodoEvent(AddTodoEvent event, Emitter<TodoState> emit){
    todoList.add(event.task);
    emit(state.copyWith(todosList: List.from(todoList)));
  }
  void _removeTodoEvent(RemoveTodoEvent event, Emitter<TodoState> emit){
    todoList.remove(event.task);
    emit(state.copyWith(todosList: List.from(todoList)));
  }
}