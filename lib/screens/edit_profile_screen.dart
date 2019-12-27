import 'package:flutter/material.dart';
import 'package:tsadv_app/data/user_rest.dart';
import 'package:tsadv_app/models/test_user_model.dart';
import 'package:pedantic/pedantic.dart' show unawaited;
import 'package:tsadv_app/screens/userInfo/userDB.dart';

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
  TextEditingController _sexController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _iinController = TextEditingController();
  TextEditingController _maritalStatusController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  updaterUser(UserTest info) async {
    info.firstName = _firstNameController.text;
    info.lastName = _lastNameController.text;
    info.middleName = _middleNameController.text;
    info.maritalStatus = _maritalStatusController.text;
    info.sex = _sexController.text;
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
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
                    ),
                    TextFormField(
                      controller: _sexController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Пол',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
                    ),
                    TextFormField(
                      controller: _iinController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'ИИН',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
                    ),
                    TextFormField(
                      controller: _maritalStatusController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Семейное положение',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
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
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
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
                            updaterUser(widget.info); //fun1
                            Navigator.pop(context); //fun2
                          },
                          textColor: Colors.white,
                          child: Text(
                            'Сохранить',
                            style: TextStyle(fontSize: 18.0),
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
