import 'dart:math';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:tsadv_app/screens/Admins/admin.dart';
import 'package:tsadv_app/screens/Admins/repo_service_admin.dart';

class SqfLiteCrud extends StatefulWidget {
  SqfLiteCrud({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SqfLiteCrudState createState() => _SqfLiteCrudState();
}

class _SqfLiteCrudState extends State<SqfLiteCrud> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> adminData;
  List<String> adminPos = [
    'Руководитель',
    'Директор',
    'Ответственный',
  ];

  Future<List<Todo>> future;
  String name;
  String position;
  int id;

  TextEditingController _positionController = TextEditingController();

  @override
  initState() {
    super.initState();
    future = RepositoryServiceTodo.getAllTodos();
  }

  // ignore: unused_element
  _submit() async {
    // Reset data
    _positionController.clear();
  }

  void readData() async {
    final todo = await RepositoryServiceTodo.getTodo(id);
    print(todo.name);
  }

  updateTodo(Todo todo) async {
    todo.name = 'please 🤫';
    await RepositoryServiceTodo.updateTodo(todo);
    setState(() {
      future = RepositoryServiceTodo.getAllTodos();
    });
  }

  deleteTodo(Todo todo) async {
    await RepositoryServiceTodo.deleteTodo(todo);
    setState(() {
      id = null;
      future = RepositoryServiceTodo.getAllTodos();
    });
  }

  _SqfLiteCrudState() {
    adminData = {
      'adminPos': '',
    };
  }

  Card buildItem(Todo todo) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Утверждающий',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'ФИО: ${todo.name}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Должность: ${todo.position}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(width: 8),
                FlatButton(
                  onPressed: () => deleteTodo(todo),
                  child: Text('Удалить'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'ФИО',
        fillColor: Colors.grey[100],
        filled: true,
      ),
      // ignore: missing_return
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => name = value,
    );
  }

  buildTextFormField2() {
    return DropDownField(
        value: adminData['adminPos'],
        controller: _positionController,
        onValueChanged: (input) => position = input,
        required: true,
        hintText: 'Пожалуйста выберите позицию',
        labelText: 'Позиция',
        items: adminPos,
        strict: false,
        setter: (dynamic newValue) {
          adminData['adminPos'] = newValue;
        });
  }

  void createTodo() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      int count = await RepositoryServiceTodo.todosCount();
      final todo = Todo(count, name, randomTodo(), position, false);
      await RepositoryServiceTodo.addTodo(todo);
      setState(() {
        id = todo.id;
        future = RepositoryServiceTodo.getAllTodos();
      });
      print(todo.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: buildTextFormField(),
          ),
          SizedBox(
            height: 12,
          ),
          Form(
            child: buildTextFormField2(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: createTodo,
                child: Text('Добавить', style: TextStyle(color: Colors.white)),
                color: Colors.green,
              )
            ],
          ),
          FutureBuilder<List<Todo>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    children:
                        snapshot.data.map((todo) => buildItem(todo)).toList());
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }

  String randomTodo() {
    final randomNumber = Random().nextInt(4);
    String todo;
    switch (randomNumber) {
      case 1:
        todo = 'test 2 💩';
        break;
      case 2:
        todo = 'test 3 🤣';
        break;
      case 3:
        todo = 'test 4 🤗';
        break;
      default:
        todo = 'test 5 🤓';
        break;
    }
    return todo;
  }
}
