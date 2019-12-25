import 'package:flutter/material.dart';
import 'package:tsadv_app/Utilities/variables.dart';
import 'package:tsadv_app/models/test_user_model.dart';
import 'package:tsadv_app/screens/menu_UI.dart';
import 'package:tsadv_app/screens/request_absent/absent_create.dart';
import 'package:tsadv_app/screens/request_absent/outbox_request_absent.dart';
import 'package:tsadv_app/screens/userInfo/userInfoHelper.dart';
import 'package:tsadv_app/utilities/PNetwork.dart';

import '../edit_profile_screen.dart';
import '../login_page.dart';

Widget getUserInfoWidget() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: FutureBuilder(
        future: getRemoteInfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
            return Center(child: Text('errorToAdmin'));
          }
          if (snapshot.hasData && snapshot.data != null) {
            return _ProfileScreenMain(context, snapshot.data);
          } else {
            return LinearProgressIndicator();
          }
        }),
  );
}

Widget _buildUserInfo(BuildContext context, UserTest person) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width,
      color: hexToColor("#F4F2F0"),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            minRadius: 40,
            maxRadius: 41,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(""),
          ),
          const SizedBox(width: 10.0),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/profile'),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      " ${person.lastName} ${person.firstName} ${person.middleName}",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${person.birthDate}',
                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          '',
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.orange),
                        ),
                      )
                    ],
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

Widget _ProfileScreenMain(BuildContext context, UserTest info) {
  return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => HiddenMenuPage())),
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.menu)),
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
                                        '${info.firstName}',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${info.middleName}',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${info.lastName}',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text('Профильные данные'),
                                    subtitle: Text(''),
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
                                                    CreatePostScreen())),
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
                                                    EditProfileScreen(info))),
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
                          subtitle: Text('${info.birthDate}'),
                          leading: Icon(Icons.email),
                        ),
                        ListTile(
                          title: Text("ИИН"),
                          subtitle: Text('${info.nationalIdentifier}'),
                          leading: Icon(Icons.phone),
                        ),
                        ListTile(
                          title: Text("Табельный номер"),
                          subtitle: Text('//'),
                          leading: Icon(Icons.location_on),
                        ),
                        ListTile(
                          title: Text('Семейное положение'),
                          subtitle: Text('****'),
                          leading: Icon(Icons.person),
                        ),
                        ListTile(
                          title: Text('Пол'),
                          subtitle: Text("${info.sexName}"),
                          leading: Icon(Icons.person_outline),
                        ),
                        FlatButton(
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginScreen())),
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
