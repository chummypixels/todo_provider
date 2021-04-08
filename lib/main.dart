import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider_firebase/pages/home_page.dart';
import 'package:todo_provider_firebase/provider/todos_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Todo App';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: Color(0XFFf6f5ee)),
        home: HomePage(),
      ),
    );
  }
}
