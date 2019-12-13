import 'package:flutter/material.dart';
import 'package:tsadv_app/models/user_info_model.dart';

class EditProfileScreen extends StatefulWidget {
  final UserPerson person;

  EditProfileScreen(this.person);

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
  TextEditingController _localeController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  _submit() async {
    widget.person.firstName = _firstNameController.text;
    widget.person.lastName = _lastNameController.text;
    widget.person.middleName = _middleNameController.text;
    widget.person.position = _positionController.text;
    widget.person.sex = _sexController.text;
    widget.person.locale = _localeController.text;
    widget.person.birthDate = _birthDateController.text;
    widget.person.timeZone = _timeController.text;
    widget.person.name = _nameController.text;

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
                    CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Colors.grey,
                      //               backgroundImage: _displayProfileImage(),
                    ),
                    FlatButton(
                      onPressed: () => Navigator.maybePop(context),
                      child: Text(
                        'Изменить фото профиля',
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 16.0),
                      ),
                    ),
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
                      controller: _positionController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: ' Должность',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
                    ),
                    TextFormField(
                      controller: _localeController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Местоположение',
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
                        labelText: 'Дата рождения',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
                    ),
                    TextFormField(
                      controller: _timeController,
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
                      controller: _nameController,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Табельный номер',
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
                            _submit(); //fun1
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
