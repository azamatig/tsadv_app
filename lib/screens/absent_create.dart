import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final format = DateFormat("yyyy-MM-dd");

  TextEditingController _captionController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _fromDateController = TextEditingController();
  TextEditingController _toDateController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  String _caption = '';
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

  _submit() async {
    if (!_isLoading && _caption.isNotEmpty) {
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
        _caption = '';
        _name = '';
        _type = '';
        _fromDate = '';
        _toDate = '';
        _status = 'Ожидание';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Новый запрос',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            height: height,
            child: Column(
              children: <Widget>[
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
                            DateTimeField(
                              controller: _fromDateController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 5.0),
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
                              onChanged: (input) =>
                                  _fromDate = input.toString(),
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
                            DateTimeField(
                              controller: _toDateController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 5.0),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(),
                                ),
                              ),
                              onChanged: (input) => _toDate = input.toString(),
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
                  height: 20,
                ),
                Text(
                  'Пожалуйста введите тип заявления',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    controller: _typeController,
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      labelText: 'Тип заявления',
                    ),
                    onChanged: (input) => _type = input,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Пожалуйста введите комментарий(по желанию)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
                    onChanged: (input) => _caption = input,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(40.0),
                  height: 50.0,
                  width: 250.0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    child: FlatButton(
                      onPressed: _submit,
                      textColor: Colors.white,
                      child: Text(
                        'Отправить',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
