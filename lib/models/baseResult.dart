import 'dart:convert';

class BaseResult {
  bool success;
  String errorDescription;

  BaseResult({
    this.success,
    this.errorDescription,
  });

  factory BaseResult.fromJson(String str) =>
      BaseResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BaseResult.fromMap(Map<String, dynamic> json) => BaseResult(
        success: json["success"] == null ? null : json["success"],
        errorDescription:
            json["errorDescription"] == null ? null : json["errorDescription"],
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "errorDescription": errorDescription == null ? null : errorDescription,
      };
}
