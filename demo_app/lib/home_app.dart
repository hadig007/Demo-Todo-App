import 'package:demo_app/list_todolis.dart';
import 'package:demo_app/widegt/add_todo.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          AddTodo(),
          const ListTodo()
        ],
      ),
    ));
  }
}
