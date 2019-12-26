import 'package:flutter/material.dart';
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
            return Center(
              child: Container(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  )),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
            return Center(child: Text('errorToAdmin'));
          }
          if (snapshot.hasData && snapshot.data != null) {
            return _ProfileScreenMain(context, snapshot.data);
          } else {
            return Center(
              child: Container(
                  height: 100, width: 100, child: CircularProgressIndicator()),
            );
          }
        }),
  );
}

// ignore: non_constant_identifier_names
Widget _ProfileScreenMain(BuildContext context, UserTest info) {
  return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => HiddenMenuPage())),
          backgroundColor: Colors.red.shade300,
          child: Icon(Icons.menu)),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 350,
              width: double.infinity,
              child: PNetworkImage(
                'https://wmdance.com/wp-content/themes/shapely/assets/images/placeholder_wide.jpg',
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
                                        color: Colors.deepPurple.shade200,
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
                                        color: Colors.pink.shade200,
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
                                        color: Colors.blue.shade200,
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
                                    'https://wmdance.com/wp-content/themes/shapely/assets/images/placeholder_wide.jpg'),
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
                          title: Text("Имя"),
                          subtitle: Text('${info.firstName}'),
                          leading: Icon(Icons.filter_1),
                        ),
                        ListTile(
                          title: Text("Отчество"),
                          subtitle: Text('${info.middleName}'),
                          leading: Icon(Icons.filter_2),
                        ),
                        ListTile(
                          title: Text("Фамилия"),
                          subtitle: Text('${info.lastName}'),
                          leading: Icon(Icons.filter_3),
                        ),
                        ListTile(
                          title: Text("Дата рождения"),
                          subtitle: Text('${info.birthDate}'),
                          leading: Icon(Icons.date_range),
                        ),
                        ListTile(
                          title: Text("ИИН"),
                          subtitle: Text('${info.nationalIdentifier}'),
                          leading: Icon(Icons.perm_identity),
                        ),
                        ListTile(
                          title: Text('Семейное положение'),
                          subtitle: Text('${info.maritalStatus}'),
                          leading: Icon(Icons.favorite_border),
                        ),
                        ListTile(
                          title: Text('Пол'),
                          subtitle: Text("${info.sexName}"),
                          leading: Icon(Icons.person_pin),
                        ),
                        FlatButton(
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginScreen())),
                          child: Text(
                            'ВЫЙТИ',
                            style: TextStyle(color: Colors.red[300]),
                          ),
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
