import 'package:flutter/cupertino.dart';
import 'package:todo_provider_firebase/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'Walk the dog'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Take out the trash',
        description: 'Clear up your front porch and the lawn'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Practice positivity',
        description: 'Stay close to God and love people'),
    Todo(createdTime: DateTime.now(), title: 'Exercise'),
    Todo(createdTime: DateTime.now(), title: 'Meditation'),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
