import 'package:flutter/material.dart';
import 'package:tsadv_app/models/user_info_model.dart';
import 'package:tsadv_app/screens/userInfo/userDB.dart';
import 'package:tsadv_app/utils/globalvar.dart';
import 'package:tsadv_app/utils/widget_utils.dart';

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestScreenState();
  }
}

class TestScreenState extends State<TestScreen> {
  UserPerson person;

  @override
  void initState() {
    getUserPersons();
    super.initState();
  }

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: Text("Профиль"),
      ),
      body: ListView(
        children: <Widget>[
          _buildUserInfo(),
          corpusForExpansionTile(
            ExpansionTile(
              title: Text("Test Screen"),
              children: <Widget>[getUserPerson()],
            ),
          ),
        ],
      ),
    );
  }

  Widget getUserPerson() {
    if (person == null) {
      return LinearProgressIndicator();
    }
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        DropdownListItem("Работодатель:", "${person.language}"),
        DropdownListItem("Документ основание:", "${person.position}"),
        DropdownListItem("Табельный номер:", "${person.id}"),
        DropdownListItem("Должность", "${person.name}"),
        DropdownListItem("Департамент", "${person.login}"),
      ]),
    );
  }

  _buildUserInfo() {
    if (person == null) {
      return Container(
        height: 200,
        color: mainBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  minRadius: 60,
                  maxRadius: 61,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    //    backgroundImage: AssetImage('assets/images/Hello.png'),
                    minRadius: 50,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            LinearProgressIndicator(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                LinearProgressIndicator(),
                SizedBox(
                  width: 2.0,
                ),
                LinearProgressIndicator(),
              ],
            )
          ],
        ),
      );
    } else {
      return FittedBox(
        fit: BoxFit.fitHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  minRadius: 60,
                  maxRadius: 61,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1517210122415-b0c70b2a09bf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
                    minRadius: 50,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${person.lastName} ${person.firstName} ${person.middleName}",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[],
            )
          ],
        ),
      );
    }
  }
}
