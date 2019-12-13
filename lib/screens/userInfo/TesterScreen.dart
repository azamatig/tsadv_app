import 'package:flutter/material.dart';
import 'package:tsadv_app/Utilities/variables.dart';
import 'package:tsadv_app/models/user_info_model.dart';
import 'package:tsadv_app/screens/userInfo/UserController.dart';

Widget getUserInfoWidget() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: FutureBuilder(
        future: getLocalInfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data == null) {
            return Center(child: Text('errorToAdmin'));
          }
          if (snapshot.hasData && snapshot.data != null) {
            return _buildUserInfo(context, snapshot.data);
          } else {
            return LinearProgressIndicator();
          }
        }),
  );
}

Widget _buildUserInfo(BuildContext context, UserPerson person) {
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
