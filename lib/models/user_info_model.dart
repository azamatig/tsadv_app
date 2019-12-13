import 'dart:convert';

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
    this.sex,
    this.birthDate,
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
        birthDate: json["birthDate"],
        sex: json["sex"],
      );

  String id;
  String login;
  String name;
  String firstName;
  String middleName;
  String lastName;
  String position;
  String sex;
  String birthDate;
  String language;
  String instanceName;
  String locale;
  String email;
  String timeZone;

  Map<String, dynamic> toMap() => {
        "id": id,
        "sex": sex,
        "birthDate": birthDate,
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
