import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tsadv_app/Utilities/utilities.dart';
import 'package:tsadv_app/data/user_rest.dart';
import 'package:tsadv_app/models/test_user_model.dart';
import 'package:tsadv_app/screens/login_page.dart';
import 'package:tsadv_app/screens/request_absent/absent_repo_service.dart';
import 'package:tsadv_app/screens/request_absent/req_model.dart';
import 'package:tsadv_app/screens/userInfo/userDB.dart';

class AbsentCRUD extends StatefulWidget {
  AbsentCRUD({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AbsentCRUDState createState() => _AbsentCRUDState();
}

class _AbsentCRUDState extends State<AbsentCRUD> {
  final format = DateFormat("yyyy-MM-dd");
  UserTest person;
  final _formKey = GlobalKey<FormState>();
  Future<List<Reqs>> future;
  String fromDate;
  String toDate;
  String comment;
  String type;
  String name;
  String info;
  int id;

  @override
  initState() {
    super.initState();
    getUserPersons();
    future = RepositoryServiceReq.getAllReqs();
  }

  Future<UserTest> getRemoteInfo() async {
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
    await UserInfoRest().getInfo();
    var res = await UserInfoRest().getInfo();
    return res;
  }

  void getUserPersons() async {
    UserTest person1 = await getRemoteInfo();
    if (person1 != null) {
      setState(() {
        person = person1;
      });
    }
  }

  void readData() async {
    final reqs = await RepositoryServiceReq.getReqs(id);
    print(reqs.name);
  }

  updateReqs(Reqs reqs) async {
    reqs.name = 'Одобрено';
    if (reqs.isDeleted == true) {
      return Navigator.push(
          context, MaterialPageRoute(builder: (_) => LoginScreen()));
    } else {
      await RepositoryServiceReq.updateReqs(reqs);
      setState(() {
        future = RepositoryServiceReq.getAllReqs();
      });
    }
  }

  rejectReqs(Reqs reqs) async {
    reqs.name = 'Отказано';
    if (reqs.isDeleted == true) {
      return Navigator.push(
          context, MaterialPageRoute(builder: (_) => LoginScreen()));
    } else {
      await RepositoryServiceReq.updateReqs(reqs);
      setState(() {
        future = RepositoryServiceReq.getAllReqs();
      });
    }
  }

  deleteReqs(Reqs reqs) async {
    await RepositoryServiceReq.deleteReqs(reqs);
    setState(() {
      id = null;
      future = RepositoryServiceReq.getAllReqs();
    });
  }

  Card buildItem(Reqs reqs) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Номер запроса - ${reqs.id}',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Дата(начало): ${reqs.fromDate}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Дата(до): ${reqs.toDate}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Типа заявления: ${reqs.comment}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Комментарий: ${reqs.type}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Статус: ${reqs.name}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => rejectReqs(reqs),
                  child:
                      Text('Отказано', style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
                SizedBox(
                  width: 8,
                ),
                FlatButton(
                  onPressed: () => updateReqs(reqs),
                  child:
                      Text('Одобрить', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                FlatButton(
                  onPressed: () => deleteReqs(reqs),
                  child: Text('Удалить'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void createReqs() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      int count = await RepositoryServiceReq.reqsCount();
      final reqs =
          Reqs(count, name, info, false, fromDate, toDate, comment, type);
      await RepositoryServiceReq.addReqs(reqs);
      setState(() {
        name = reqs.name;
        fromDate = reqs.fromDate;
        toDate = reqs.toDate;
        comment = reqs.comment;
        type = reqs.type;
        id = reqs.id;
        future = RepositoryServiceReq.getAllReqs();
      });
      print(reqs.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          FutureBuilder<List<Reqs>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    children:
                        snapshot.data.map((reqs) => buildItem(reqs)).toList());
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
