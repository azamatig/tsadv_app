import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsadv_app/data/user_rest.dart';
import 'package:tsadv_app/models/test_user_model.dart';

class EditProfileScreen extends StatefulWidget {
  final UserTest info;

  EditProfileScreen(this.info);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _middleNameController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _iinController = TextEditingController();
  var _sexController;
  var _maritalStatusController;
  Color _pickedFemale = Colors.black54;
  Color _pickedMale = Colors.black54;
  Color _pickedMarried = Colors.black54;
  Color _pickedUmmarried = Colors.black54;

  @override
  void initState() {
    super.initState();
  }

  setMaleSex() {
    setState(() {
      _sexController = '49eb65bc-e2f1-c78e-3fc1-5ea9e1c66583';
    });
  }

  setFemaleSex() {
    setState(() {
      _sexController = '7ae580f1-b20b-ca3f-11dc-fcd53e882cdf';
    });
  }

  setMarried() {
    setState(() {
      _maritalStatusController = '296a70b9-ecf9-cfd6-daed-0299f783f047';
    });
  }

  setBachelor() {
    setState(() {
      _maritalStatusController = '9a89faa2-c10c-706f-afc7-6af382f2d634';
    });
  }

  updaterUser(UserTest info) async {
    info.firstName = _firstNameController.text;
    info.lastName = _lastNameController.text;
    info.middleName = _middleNameController.text;
    info.sex = _sexController;
    info.maritalStatus = _maritalStatusController;
    info.nationalIdentifier = _iinController.text;
    var res = await UserInfoRest().sendNewRequest(info);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Редактировать профиль',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    //              CircleAvatar(
                    //              radius: 60.0,
                    //            backgroundColor: Colors.grey,
                    //          backgroundImage: NetworkImage(
                    //            'https://c7.hotpng.com/preview/136/22/549/user-profile-computer-icons-girl-customer-avatar.jpg'),
                    //    ),
                    //   FlatButton(
                    //     onPressed: () => Navigator.maybePop(context),
                    //     child: Text(
                    //       'Изменить фото профиля',
                    //       style: TextStyle(
                    //           color: Theme.of(context).accentColor,
                    //           fontSize: 16.0),
                    //    ),
                    //   ),
                    TextFormField(
                      controller: _firstNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Имя',
                      ),
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _middleNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Отчество',
                      ),
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Фамилия',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      controller: _iinController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'ИИН',
                      ),
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно для заполнения';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _birthDateController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Дата Рождения',
                      ),
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Обязательно в формате yyyy-Mm-Dd';
                        }
                        return null;
                      },
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0.0),
                        child: Text('Семейное положение',
                            style: TextStyle(fontSize: 21))),
                    Visibility(
                      visible: false,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('$_maritalStatusController',
                              style: TextStyle(fontSize: 21))),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(22.0, 10.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: _pickedMarried,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  if (_pickedMarried == Colors.black54) {
                                    _pickedMarried = Colors.black87;
                                  } else {
                                    _pickedMarried = Colors.black54;
                                  }
                                });
                                setMarried();
                              },
                              textColor: Colors.white,
                              child: Text(
                                'Женат/Замужем',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: _pickedUmmarried,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  if (_pickedUmmarried == Colors.black54) {
                                    _pickedUmmarried = Colors.black87;
                                  } else {
                                    _pickedUmmarried = Colors.black54;
                                  }
                                });
                                setBachelor();
                              },
                              textColor: Colors.white,
                              child: Text(
                                'Холост/Не замужем',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0.0),
                        child: Text('Ваш пол', style: TextStyle(fontSize: 21))),
                    Visibility(
                      visible: false,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('$_sexController',
                              style: TextStyle(fontSize: 21))),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(75.0, 8.0, 8.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: _pickedMale,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  if (_pickedMale == Colors.black54) {
                                    _pickedMale = Colors.black87;
                                  } else {
                                    _pickedMale = Colors.black54;
                                  }
                                });
                                setMaleSex();
                              },
                              textColor: Colors.white,
                              child: Text(
                                'Мужской',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: _pickedFemale,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  if (_pickedFemale == Colors.black54) {
                                    _pickedFemale = Colors.black87;
                                  } else {
                                    _pickedFemale = Colors.black54;
                                  }
                                });
                                setFemaleSex();
                              },
                              textColor: Colors.white,
                              child: Text(
                                'Женский',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(40.0),
                      height: 50.0,
                      width: 250.0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        child: FlatButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a updatus.
                              updaterUser(widget.info); //fun1
                            }
                          },
                          textColor: Colors.white,
                          child: Text(
                            'Сохранить',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
