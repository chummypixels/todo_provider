import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_firebase/provider/todos_provider.dart';
import 'package:todo_provider_firebase/widgets/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text(
              'No Todo',
              style: TextStyle(fontSize: 20.0),
            ),
          )
        : ListView.separated(
            padding: EdgeInsets.all(16.0),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(
                todo: todo,
              );
            },
            itemCount: todos.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
  }
}
