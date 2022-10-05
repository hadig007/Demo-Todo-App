// ignore_for_file: depend_on_referenced_packages

import 'package:demo_app/provider/todolist_proviedr.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Todo extends StatelessWidget {
  Todo({required this.todo, required this.id, required this.status, Key? key}) : super(key: key);

  String? todo;
  String? id;
  bool? status;

  @override
  Widget build(BuildContext context) {
    final todoprovider = Provider.of<TodoProvieder>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: 270,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              border: Border.all(width: 1, color: const Color.fromARGB(255, 231, 231, 231)),
            ),
            child: Text(
              todo!,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          if (status == true)
            Container(
                width: 80,
                height: 40,
                decoration: const BoxDecoration(color: Color.fromARGB(255, 71, 197, 255)),
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                )),
          if (status == false)
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(color: Color.fromARGB(255, 71, 197, 255)),
              child: IconButton(
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (id == "id") {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Silahkan Refresh terlebih dahulu"),
                      duration: Duration(seconds: 1),
                    ));
                    return;
                  }
                  http.put(
                    Uri.parse('http://127.0.0.1:3030/api/todolist/update'),
                    body: {'id': id},
                  ).then(
                    (value) => todoprovider.update_todo(id),
                  );
                },
              ),
            ),
          if (status == false)
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(color: Colors.red),
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (id == "id") {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Silahkan Refresh terlebih dahulu"),
                      duration: Duration(seconds: 1),
                    ));
                    return;
                  }
                  http.post(
                    Uri.parse('http://127.0.0.1:3030/api/todolist/destroy'),
                    body: {'id': id},
                  ).then((value) => todoprovider.delete_todo(id));
                },
              ),
            )
        ],
      ),
    );
  }
}
