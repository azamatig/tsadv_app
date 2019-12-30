import 'dart:convert';

import 'package:tsadv_app/data/dbHelper.dart';
import 'package:tsadv_app/models/baseResult.dart';
import 'package:tsadv_app/models/test_user_model.dart';
import 'package:tsadv_app/services/auth.dart';
import 'package:tsadv_app/utilities/variables.dart';

class UserInfoRest {
  Auth provider;

  UserInfoRest() {
    provider = Auth();
  }

  getInfo() async {
    final client = await provider.client;
    var url =
        '${restApiUrl}v2/services/tsadv_RcApiService/getUserPerson?lang=ru';
    var response = await client.get(url, headers: {
      'Content-Type': 'application/json',
    });

    var scores = jsonDecode(response.body);
    assert(scores is Map);
    UserTest info = UserTest.fromMap(scores);
    // UserInfoDB().insertNewInfo(info);
    userId = info.id;
    var res = await TimelyDB().setUserId(info.id);
    if (res >= 1) {
      return info;
    } else {
      var timely = await TimelyDB().getTimely();
      timely.userId = info.id;
      TimelyDB().updateClient(timely);
    }
    return info;
  }

  sendNewRequest(UserTest info) async {
    final client = await provider.client;
    var url = '${restApiUrl}v2/services/tsadv_RcApiService/updatePerson';
    var body = """
        {
      "person":{
          "firstName": "${info.firstName}",
          "lastName": "${info.lastName}",
          "middleName": "${info.middleName}",
          "nationalIdentifier": "${info.nationalIdentifier}",
          "sex": "${info.sex}",
          "sexName": "${info.sexName}",
          "birthDate": "${info.birthDate}",
          "maritalStatus": "${info.maritalStatus}"
          }
    }
        """;
    var response = await client
        .post(url, body: body, headers: {'Content-Type': 'application/json'});
    BaseResult result = BaseResult.fromJson(response.body);
    return result;
  }
}
