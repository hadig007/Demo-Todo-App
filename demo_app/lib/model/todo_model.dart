class TodoModel {
  String? id;
  String? name;
  bool? status;

  TodoModel({required this.id, required this.name, required this.status});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    status = json['status'];
  }
}
