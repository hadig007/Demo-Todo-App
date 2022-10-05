import 'package:demo_app/provider/todolist_proviedr.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);

  TextEditingController todo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoprovider = Provider.of<TodoProvieder>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: 300,
          height: 50,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 117, 211, 255)),
          child: TextField(
            decoration:
                const InputDecoration(hintText: "Masukkan todo baru", border: InputBorder.none),
            controller: todo,
          ),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(color: Colors.lightBlue),
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              http.post(
                Uri.parse('http://127.0.0.1:3030/api/todolist/store'),
                body: {'name': todo.text},
              ).then((value) => {
                    todoprovider.add_todo("id", todo.text, false),
                    todo.text = "",
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 200),
                      content: Text(
                        "Tambah todo bershasil",
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                      backgroundColor: Colors.white,
                    ))
                  });
            },
          ),
        )
      ],
    );
  }
}
