import 'package:flutter/material.dart';
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
  TextEditingController _sexController = TextEditingController();
  TextEditingController _birthDateController = TextEditingController();
  TextEditingController _iinController = TextEditingController();
  TextEditingController _maritalStatusController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  bool _isLoading = false;

  UserTest info;

  @override
  void initState() {
    super.initState();
  }

  sendOrder(UserTest info) async {
    var res = await UserInfoRest().sendNewRequest(info);
    return res;
  }

  _submit() async {
    widget.info.firstName = _firstNameController.text;
    widget.info.lastName = _lastNameController.text;
    widget.info.middleName = _middleNameController.text;
    widget.info.maritalStatus = _maritalStatusController.text;
    widget.info.sex = _sexController.text;
    widget.info.nationalIdentifier = _iinController.text;

    if (_formKey.currentState.validate() && !_isLoading) {
      _formKey.currentState.save();

      setState(() {
        _isLoading = true;
      });
    }
  }
  /* _displayProfileImage() {
    // No new profile image
    if (_profileImage == null) {
      // No existing profile image
      if (widget.user.profileImageUrl.isEmpty) {
        // Display placeholder
        return AssetImage('assets/images/user_placeholder.jpg');
      } else {
        // User profile image exists
        return CachedNetworkImageProvider(widget.user.profileImageUrl);
      }
    } else {
      // New profile image
      return FileImage(_profileImage);
    }
  }
*/

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
            _isLoading
                ? LinearProgressIndicator(
                    backgroundColor: Colors.deepPurple[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  )
                : SizedBox.shrink(),
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
                            sendOrder(info); //fun1
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
