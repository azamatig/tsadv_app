import 'dart:convert';

import 'package:tsadv_app/data/dbHelper.dart';
import 'package:tsadv_app/screens/userInfo/userDB.dart';
import 'package:tsadv_app/services/auth.dart';
import 'package:tsadv_app/utils/globalvar.dart';

UserPerson userPersonFromJson(String str) =>
    UserPerson.fromMap(json.decode(str));

String userPersonToJson(UserPerson data) => json.encode(data.toMap());

class UserPerson {
  UserPerson({
    this.id,
    this.login,
    this.name,
    this.firstName,
    this.middleName,
    this.lastName,
    this.position,
    this.email,
    this.timeZone,
    this.language,
    this.instanceName,
    this.locale,
  });

  factory UserPerson.fromMap(Map<String, dynamic> json) => UserPerson(
        id: json["id"],
        login: json["login"],
        name: json["name"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        position: json["position"],
        email: json["email"],
        timeZone: json["timeZone"],
        language: json["language"],
        instanceName: json["_instanceName"],
        locale: json["locale"],
      );

  String id;
  String login;
  String name;
  String firstName;
  String middleName;
  String lastName;
  String position;
  String email;
  String timeZone;
  String language;
  String instanceName;
  String locale;

  Map<String, dynamic> toMap() => {
        "id": id,
        "login": login,
        "name": name,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "position": position,
        "email": email,
        "timeZone": timeZone,
        "language": language,
        "_instanceName": instanceName,
        "locale": locale,
      };
}

class UserInfoRest {
  Auth provider;

  UserInfoRest() {
    provider = Auth();
  }

  getUserPerson() async {
    final client = await provider.client;
    var url = '${restApiUrl}v2/services/tsadv_RcApiService/';
    var response =
        await client.get(url, headers: {'Content-Type': 'application/json'});

    var personInt = jsonDecode(response.body);
    assert(personInt is Map);
    UserPerson person = UserPerson.fromMap(personInt);
    UserPersonDB().insertNewInfo(person);
    userId = person.id;
    var res = await TimelyDB().setUserId(person.id);
    if (res >= 1) {
      return person;
    } else {
      var timely = await TimelyDB().getTimely();
      timely.userId = person.id;
      TimelyDB().updateClient(timely);
    }
    return person;
  }
}
