// To parse this JSON data, do
//
//     final userTest = userTestFromJson(jsonString);

import 'dart:convert';

UserTest userTestFromJson(String str) => UserTest.fromMap(json.decode(str));

String userTestToJson(UserTest data) => json.encode(data.toMap());

class UserTest {
  String entityName;
  String id;
  String lastName;
  String maritalStatus;
  String maritalStatusName;
  List<dynamic> education;
  List<dynamic> attachments;
  String sex;
  List<dynamic> experience;
  DateTime birthDate;
  List<dynamic> competences;
  String firstName;
  String nationalityName;
  String sexName;
  String middleName;
  String nationalIdentifier;
  List<dynamic> contacts;

  UserTest({
    this.entityName,
    this.id,
    this.maritalStatus,
    this.maritalStatusName,
    this.lastName,
    this.education,
    this.attachments,
    this.sex,
    this.experience,
    this.birthDate,
    this.nationalityName,
    this.competences,
    this.firstName,
    this.sexName,
    this.middleName,
    this.nationalIdentifier,
    this.contacts,
  });

  factory UserTest.fromMap(Map<String, dynamic> json) => UserTest(
        entityName: json["_entityName"],
        nationalityName: json["nationalityName"],
        id: json["id"],
        maritalStatus: json["maritalStatus"],
        maritalStatusName: json["maritalStatusName"],
        lastName: json["lastName"],
        education: List<dynamic>.from(json["education"].map((x) => x)),
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        sex: json["sex"],
        experience: List<dynamic>.from(json["experience"].map((x) => x)),
        birthDate: DateTime.parse(json["birthDate"]),
        competences: List<dynamic>.from(json["competences"].map((x) => x)),
        firstName: json["firstName"],
        sexName: json["sexName"],
        middleName: json["middleName"],
        nationalIdentifier: json["nationalIdentifier"],
        contacts: List<dynamic>.from(json["contacts"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "_entityName": entityName,
        "nationalityName": nationalityName,
        "id": id,
        "maritalStatus": maritalStatus,
        "maritalStatusName": maritalStatusName,
        "lastName": lastName,
        "education": List<dynamic>.from(education.map((x) => x)),
        "attachments": List<dynamic>.from(attachments.map((x) => x)),
        "sex": sex,
        "experience": List<dynamic>.from(experience.map((x) => x)),
        "birthDate":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "competences": List<dynamic>.from(competences.map((x) => x)),
        "firstName": firstName,
        "sexName": sexName,
        "middleName": middleName,
        "nationalIdentifier": nationalIdentifier,
        "contacts": List<dynamic>.from(contacts.map((x) => x)),
      };
}
