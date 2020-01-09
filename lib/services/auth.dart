import 'package:oauth2/oauth2.dart';
import 'package:tsadv_app/data/dbHelper.dart';
import 'package:tsadv_app/models/db_model.dart';
import 'package:tsadv_app/services/token.dart';

class Auth {
  Client _client;

  Future<Client> get client async {
    if (_client != null) return _client;
    _client = await getFromSavedPerson();
    return _client;
  }

  authenticationRest(String login, String password) async {
    var res = await AccessToken().getAccessToken(login, password);
    if (checkIsTokenFalse(res)) {
      return res;
    }
    _client = res;
    var freya = Freya.forClient(id: 1, login: login, password: password);
    FreyaDB().updateClient(freya);
    return _client;
  }

  getFromSavedPerson() async {
    var freya = await FreyaDB().getFreya();
    var res = await AccessToken().getAccessToken(freya.login, freya.password);
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
