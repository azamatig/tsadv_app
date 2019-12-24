import 'package:tsadv_app/Utilities/utilities.dart';
import 'package:tsadv_app/data/user_rest.dart';
import 'package:tsadv_app/models/test_user_model.dart';
import 'package:tsadv_app/screens/userInfo/userDB.dart';

getLocalInfo() async {
  var person;
  person = await UserPersonDB().getUser();
  if (person == null) {
    person = getRemoteInfo();
  }
  return person;
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
