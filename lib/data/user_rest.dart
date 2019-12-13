import 'dart:convert';

import 'package:tsadv_app/Utilities/variables.dart';
import 'package:tsadv_app/data/dbHelper.dart';
import 'package:tsadv_app/models/user_info_model.dart';
import 'package:tsadv_app/services/auth.dart';

class UserInfoRest {
  Auth provider;

  UserInfoRest() {
    provider = Auth();
  }

  getUserPerson() async {
    final client = await provider.client;
    var url =
        '${restApiUrl}v2/services/tsadv_RcApiService/getUserPerson?lang=ru';
    var response =
        await client.get(url, headers: {'Content-Type': 'application/json'});

    var personInt = jsonDecode(response.body);
    assert(personInt is Map);
    UserPerson person = UserPerson.fromMap(personInt);
    // UserPersonDB().insertNewInfo(person);
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
