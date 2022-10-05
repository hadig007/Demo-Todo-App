import 'package:demo_app/home_app.dart';
import 'package:demo_app/provider/todolist_proviedr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoProvieder>.value(
          value: TodoProvieder(),
        )
      ],
      child: const MaterialApp(
        home: HomeApp(),
      ),
    );
  }
}
