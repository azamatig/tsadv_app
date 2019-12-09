import 'package:oauth2/oauth2.dart';
import 'package:tsadv_app/data/dbHelper.dart';
import 'package:tsadv_app/models/db_model.dart';
import 'package:tsadv_app/services/accessToken.dart';

class Auth {
  Client _client;

  Future<Client> get client async {
    if (_client != null) return _client;
    // if _client is null we instantiate it
    _client = await getFromSavedPerson();
    return _client;
  }

  authenticationRest(String login, String password) async {
    var res = await AccessToken().getAccessToken(login, password);
    if (checkIsTokenFalse(res)) {
      return res;
    }
    _client = res;
    var timely = Timely.forClient(id: 1, login: login, password: password);
    TimelyDB().updateClient(timely);
    return _client;
  }

  getFromSavedPerson() async {
    var timely = await TimelyDB().getTimely();
    var res = await AccessToken().getAccessToken(timely.login, timely.password);
    if (checkIsTokenFalse(res)) {
      return res;
    }
    _client = res;
    return _client;
  }

  bool checkIsTokenFalse(var res) {
    if (res is String) {
      return true;
    } else {
      return false;
    }
  }
}
