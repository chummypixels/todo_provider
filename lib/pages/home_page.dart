import 'package:flutter/material.dart';
import 'package:todo_provider_firebase/main.dart';
import 'package:todo_provider_firebase/widgets/add_todo_dialog_widget.dart';
import 'package:todo_provider_firebase/widgets/completed_list_widget.dart';
import 'package:todo_provider_firebase/widgets/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'Todos'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AddTodoDialogWidget(),
              barrierDismissible: false);
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Icon(Icons.add),
      ),
    );
  }
}
