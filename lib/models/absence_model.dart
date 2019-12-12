class Test {
  Test({
    this.id,
    this.fromDate,
    this.toDate,
    this.comments,
    this.type,
    this.status,
    this.numberId,
  });

  factory Test.fromMap(Map<String, dynamic> json) => Test(
        id: json["id"],
        fromDate: json["fromDate"],
        toDate: json["toDate"],
        comments: json["comments"],
        type: json["type"],
        status: json["status"],
        numberId: json["numberId"],
      );

  String id;
  String fromDate;
  String toDate;
  String comments;
  String type;
  String status;
  String numberId;

  Map<String, dynamic> toMap() => {
        "id": id,
        "fromDate": fromDate,
        "toDate": toDate,
        "comments": comments,
        "type": type,
        "status": status,
        "numberId": numberId,
      };
}
