import 'dart:math';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:tsadv_app/screens/Admins/adminList.dart';
import 'package:tsadv_app/screens/request_absent/abresnt_repo_service.dart';
import 'package:tsadv_app/screens/request_absent/req_model.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final format = DateFormat("yyyy-MM-dd");
  DateTime currentDate = DateTime.now();
  String difference = "";
  Future<List<Reqs>> future;
  String fromDate;
  String toDate;
  String comment;
  String type;
  String name;
  int id;

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData;
  List<String> vacation = [
    'Экологический отпуск',
    'Социальный отпуск',
    'Ежегодный трудовой отпуск',
    'Отпуск по Болашак',
    'Социальный неоплачиваемый',
    'Воинская служба',
    'Учебный оплачиваемый отпуск',
    'Справка МЦГА(профлечение)',
    'Отпуск по уходу за ребенком',
    'Отпуск без сохранение зп',
  ];

  TextEditingController _captionController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _fromDateController = TextEditingController();
  TextEditingController _toDateController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  String _comment = '';
  // ignore: unused_field
  String _name = '';
  // ignore: unused_field
  String _fromDate = '';
  // ignore: unused_field
  String _toDate = '';
  // ignore: unused_field
  String _type = '';
  // ignore: unused_field
  String _status = 'Ожидание';

  bool _isLoading = false;

  void createReqs() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      int count = await RepositoryServiceReq.reqsCount();
      final reqs = Reqs(
          count, name, randomReqs(), false, fromDate, toDate, comment, type);
      await RepositoryServiceReq.addReqs(reqs);
      setState(() {
        fromDate = reqs.fromDate;
        toDate = reqs.toDate;
        comment = reqs.comment;
        type = reqs.type;
        id = reqs.id;
        future = RepositoryServiceReq.getAllReqs();
      });
      print(reqs.id);
    }
  }

  String randomReqs() {
    final randomNumber = Random().nextInt(4);
    String reqs;
    switch (randomNumber) {
      case 1:
        reqs = 'test 💩';
        break;
      case 2:
        reqs = 'test 🤣';
        break;
      case 3:
        reqs = 'test 🤗';
        break;
      default:
        reqs = 'test 🤓';
        break;
    }
    return reqs;
  }

  // ignore: unused_element
  _submit() async {
    if (!_isLoading && _comment.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      // Reset data
      _captionController.clear();
      _nameController.clear();
      _fromDateController.clear();
      _toDateController.clear();
      _typeController.clear();

      setState(() {
        _comment = '';
        _name = '';
        _type = '';
        _fromDate = '';
        _toDate = '';
        _status = 'Ожидание';
        _isLoading = false;
      });
    }
  }

  _CreatePostScreenState() {
    formData = {
      'vacation': '',
    };
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            createReqs();
            Navigator.pop(context);
          },
          backgroundColor: Colors.green,
          child: Icon(Icons.navigate_next)),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 0.0),
            child: Text(
              'Новый запрос',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: <Widget>[
              _isLoading
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.blue[200],
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox(height: 20.0),
              Text(
                'Пожалуйста введите даты отпуска',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 170,
                      child: Column(
                        children: <Widget>[
                          Text('Дата начала'),
                          SizedBox(
                            height: 8,
                          ),
                          DateTimeField(
                            controller: _fromDateController,
                            decoration: InputDecoration(
                              labelText: "Начало",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                            format: format,
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                            },
                            onChanged: (input) => fromDate = input.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 170,
                      child: Column(
                        children: <Widget>[
                          Text('Дата окончания'),
                          SizedBox(
                            height: 8,
                          ),
                          DateTimeField(
                            controller: _toDateController,
                            decoration: InputDecoration(
                              labelText: "Конец",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                            onChanged: (input) => toDate = input.toString(),
                            format: format,
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Пожалуйста установите тип заявления',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 5.0),
                  child: Form(
                    key: _formKey,
                    autovalidate: false,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Divider(
                              height: 5.0,
                              color: Theme.of(context).primaryColor),
                          DropDownField(
                              value: formData['vacation'],
                              controller: _typeController,
                              onValueChanged: (input) => type = input,
                              required: true,
                              hintText: 'Пожалуйста введите тип заявления',
                              labelText: 'Тип заявления',
                              items: vacation,
                              strict: false,
                              setter: (dynamic newValue) {
                                formData['vacation'] = newValue;
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                              height: 5.0,
                              color: Theme.of(context).primaryColor),
                          Text(
                            'Пожалуйста введите комментарий(по желанию)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.0),
                            child: TextField(
                              controller: _captionController,
                              style: TextStyle(fontSize: 18.0),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                labelText: 'Комментарий',
                              ),
                              onChanged: (input) => comment = input,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text('Список утверждающих'),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(height: 300, child: SqfLiteCrud()),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
