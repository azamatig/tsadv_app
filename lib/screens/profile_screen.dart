import 'package:flutter/material.dart';
import 'package:tsadv_app/Utilities/PNetwork.dart';
import 'package:tsadv_app/Utilities/Utilities.dart';
import 'package:tsadv_app/data/user_rest.dart';
import 'package:tsadv_app/models/user_info_model.dart';
import 'package:tsadv_app/screens/absent_create.dart';
import 'package:tsadv_app/screens/absent_list_screen.dart';
import 'package:tsadv_app/screens/edit_profile_screen.dart';
import 'package:tsadv_app/screens/login_page.dart';
import 'package:tsadv_app/screens/userInfo/userDB.dart';

class ProfileThreePage extends StatefulWidget {
  ProfileThreePage();

  @override
  _ProfileThreePageState createState() => _ProfileThreePageState();
}

class _ProfileThreePageState extends State<ProfileThreePage> {
  @override
  void initState() {
    getUserPersons();
    super.initState();
  }

  UserPerson person;

  Future<UserPerson> getRemoteInfo() async {
    var res = await checkConnection();
    var person;
    if (res == true) {
      person = await getRestInfo();
      if (person != null) return person;
    }
    person = await UserPersonDB().getUser();

    return person;
  }

  getRestInfo() async {
    await UserInfoRest().getUserPerson();
    var res = await UserInfoRest().getUserPerson();
    return res;
  }

  void getUserPersons() async {
    UserPerson person1 = await getRemoteInfo();
    if (person1 != null) {
      setState(() {
        person = person1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: 350,
                width: double.infinity,
                child: PNetworkImage(
                  'https://i.pinimg.com/originals/8b/c0/5b/8bc05b293a4d30c615be694b3fa87954.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 225.0, 16.0, 16.0),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.only(top: 16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 94.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          ' ${person.firstName}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${person.middleName}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${person.lastName}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Text('${person.position}'),
                                      subtitle: Text('${person.locale}'),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black26,
                              ),
                              SizedBox(height: 5.0),
                              Center(child: Text('Мои отсутствия')),
                              SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  CreatePostScreen(),
                                            ),
                                          ),
                                          color: Colors.green,
                                          icon: Icon(Icons.add_circle_outline),
                                        ),
                                        Text("Создать запрос"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => LeaveList())),
                                          color: Colors.red,
                                          icon: Icon(Icons.date_range),
                                        ),
                                        Text("Мои запросы"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      EditProfileScreen(
                                                          person))),
                                          color: Colors.blueAccent,
                                          icon: Icon(Icons.edit),
                                        ),
                                        Text("Профиль"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.pinimg.com/originals/8b/c0/5b/8bc05b293a4d30c615be694b3fa87954.jpg'),
                                  fit: BoxFit.cover)),
                          margin: EdgeInsets.only(left: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text("Общая информация"),
                          ),
                          Divider(),
                          ListTile(
                            title: Text("Дата рождения"),
                            subtitle: Text('${person.birthDate}'),
                            leading: Icon(Icons.email),
                          ),
                          ListTile(
                            title: Text("ИИН"),
                            subtitle: Text('${person.timeZone}'),
                            leading: Icon(Icons.phone),
                          ),
                          ListTile(
                            title: Text("Табельный номер"),
                            subtitle: Text('${person.name}'),
                            leading: Icon(Icons.location_on),
                          ),
                          ListTile(
                            title: Text('Семейное положение'),
                            subtitle: Text('По себе не судят'),
                            leading: Icon(Icons.person),
                          ),
                          ListTile(
                            title: Text('Пол'),
                            subtitle: Text("${person.sex}"),
                            leading: Icon(Icons.person_outline),
                          ),
                          FlatButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen())),
                            child: Text('ВЫЙТИ'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              )
            ],
          ),
        ));
  }
}
