import 'package:demo_app/model/todo_model.dart';
import 'package:demo_app/services/todolist_api.dart';
import 'package:flutter/cupertino.dart';

enum Status { initial, loading, loaded, error }

class TodoProvieder with ChangeNotifier {
  TodoProvieder() {
    _fetchTodos();
  }
  Status _status = Status.initial;
  Status get status => _status;
  List<TodoModel> _todos = [];

  Future<void> _fetchTodos() async {
    try {
      final todosApi = await TodoListApi.getTodos();
      _todos = List.from(todosApi.reversed);

      _status = Status.loaded;
    } catch (e) {
      _status = Status.error;
    }
    notifyListeners();
  }

  List<TodoModel> get todos {
    return _todos;
  }

  add_todo(id, name, status) {
    print(id);
    _todos.insert(0, TodoModel(id: id, name: name, status: status));
    notifyListeners();
  }

  delete_todo(id) {
    var ids = _todos.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  update_todo(id) {
    var ids = _todos.singleWhere((element) => element.id == id).status = true;
    notifyListeners();
  }
}
