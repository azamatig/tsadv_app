import 'DBCreator.dart';

class Todo {
  int id;
  String name;
  String info;
  String position;
  bool isDeleted;

  Todo(this.id, this.name, this.info, this.position, this.isDeleted);

  Todo.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.name = json[DatabaseCreator.name];
    this.position = json[DatabaseCreator.position];
    this.info = json[DatabaseCreator.info];
    this.isDeleted = json[DatabaseCreator.isDeleted] == 1;
  }
}
