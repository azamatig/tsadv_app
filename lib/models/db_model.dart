import 'dart:convert';

class Timely {
  Timely({
    this.id,
    this.login,
    this.password,
    this.pin,
    this.userId,
  });

  Timely.forClient({
    this.id,
    this.login,
    this.password,
  });

  factory Timely.fromJson(String str) => Timely.fromMap(json.decode(str));

  factory Timely.fromMap(Map<String, dynamic> json) => Timely(
        id: json["id"] == null ? null : json["id"],
        login: json["login"] == null ? null : json["login"],
        password: json["password"] == null ? null : json["password"],
        pin: json["pin"] == null ? null : json["pin"],
        userId: json["userId"] == null ? null : json["userId"],
      );

  int id;
  String login;
  String password;
  String pin;
  String userId;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "login": login == null ? null : login,
        "password": password == null ? null : password,
        "pin": pin == null ? null : pin,
        "userId": userId == null ? null : userId,
      };
}
