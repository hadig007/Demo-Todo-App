import 'dart:convert';

import 'package:demo_app/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoListApi {
  static Future<List<TodoModel>> getTodos() async {
    final getTodos = await http.get(Uri.parse("http://127.0.0.1:3030/api/todolist"));
    final List resbody = jsonDecode(getTodos.body);
    print(resbody[0]);

    return resbody.map((data) => TodoModel.fromJson(data)).toList();
  }
}
