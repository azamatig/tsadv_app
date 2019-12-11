import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen();

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
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
                      controller: firstNameController,
                      //       initialValue: _name,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Имя',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid name'
                          : null,
                      //           onSaved: (input) => _name = input,
                    ),
                    TextFormField(
                      controller: lastNameController,
                      //               initialValue: _lastname,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Фамилия',
                      ),
                      validator: (input) => input.trim().length < 1
                          ? 'Please enter a valid name'
                          : null,
                      //                  onSaved: (input) => _lastname = input,
                    ),
                    TextFormField(
                      //                  initialValue: _birth,
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
                      //                  onSaved: (input) => _birth = input,
                    ),
                    TextFormField(
                      //                   initialValue: _gender,
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
                      //               onSaved: (input) => _gender = input,
                    ),
                    TextFormField(
                      //                initialValue: _bio,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'О себе',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
                      //                  onSaved: (input) => _bio = input,
                    ),
                    TextFormField(
                      //                initialValue: _empdate,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Дете выхода на работу',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
                      //              onSaved: (input) => _empdate = input,
                    ),
                    TextFormField(
                      //             initialValue: _phone,

                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Телефон',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
                      //              onSaved: (input) => _phone = input,
                    ),
                    TextFormField(
                      //               initialValue: _location,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Город',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
                      //                     onSaved: (input) => _location = input,
                    ),
                    TextFormField(
                      //                   initialValue: _adress,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Адрес',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
                      //                    onSaved: (input) => _adress = input,
                    ),
                    TextFormField(
                      //              initialValue: _occupation,
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.trip_origin,
                          size: 30.0,
                        ),
                        labelText: 'Должность',
                      ),
                      validator: (input) => input.trim().length > 150
                          ? 'Please enter a bio less than 150 characters'
                          : null,
                      //           onSaved: (input) => _occupation = input,
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
                          onPressed: null,
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
