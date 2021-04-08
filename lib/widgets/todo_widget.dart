import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_firebase/model/todo.dart';
import 'package:todo_provider_firebase/pages/edit_todo_page.dart';
import 'package:todo_provider_firebase/provider/todos_provider.dart';

import '../Utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({Key key, this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        key: Key(todo.id),
        child: buildTodo(context),
        actions: [
          IconSlideAction(
            icon: Icons.edit,
            color: Colors.green,
            caption: 'Edit',
            onTap: () {
              editTodo(context, todo);
            },
          )
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            caption: 'Delete',
            onTap: () {
              deleteTodo(context, todo);
            },
          )
        ],
      ),
    );
  }

  Widget buildTodo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        editTodo(context, todo);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);

                  Utils.showSnackBar(context,
                      isDone ? 'Task completed' : 'Task marked as incomplete');
                }),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22.0),
                  ),
                  if (todo.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4.0),
                      child: Text(
                        todo.description,
                        style: TextStyle(fontSize: 20.0, height: 1.5),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditTodoPage(todo: todo),
      ),
    );
  }
}
