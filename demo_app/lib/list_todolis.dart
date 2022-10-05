// ignore_for_file: depend_on_referenced_packages

import 'package:demo_app/widegt/todolist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/todolist_proviedr.dart';

class ListTodo extends StatelessWidget {
  const ListTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoprovider = Provider.of<TodoProvieder>(context);

    return Expanded(child: Builder(
      builder: (c) {
        if (todoprovider.status == Status.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (todoprovider.status == Status.error) {
          return Column(
            children: const [
              SizedBox(
                height: 50,
              ),
              Text(
                "Something went error!.",
                style: TextStyle(color: Colors.red),
              ),
            ],
          );
        }
        return ListView.builder(
          itemBuilder: (c, i) {
            if (todoprovider.todos[i].status == false) {
              return Todo(
                id: todoprovider.todos[i].id,
                todo: todoprovider.todos[i].name,
                status: todoprovider.todos[i].status,
              );
            } else {
              return Todo(
                id: todoprovider.todos[i].id,
                todo: todoprovider.todos[i].name,
                status: todoprovider.todos[i].status,
              );
            }
          },
          itemCount: todoprovider.todos.length,
        );
      },
    ));
  }
}
