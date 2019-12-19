import 'package:tsadv_app/screens/request_absent/absentDB.dart';

class Reqs {
  int id;
  String fromDate;
  String toDate;
  String comment;
  String type;
  String name;
  String info;
  bool isDeleted;

  Reqs(this.id, this.name, this.info, this.isDeleted, this.fromDate,
      this.toDate, this.type, this.comment);

  Reqs.fromJson(Map<String, dynamic> json) {
    this.id = json[DBRequest.id];
    this.name = json[DBRequest.name];
    this.info = json[DBRequest.info];
    this.fromDate = json[DBRequest.fromDate];
    this.toDate = json[DBRequest.toDate];
    this.comment = json[DBRequest.comment];
    this.type = json[DBRequest.type];
    this.isDeleted = json[DBRequest.isDeleted] == 1;
  }
}
