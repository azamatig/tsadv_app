import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:tsadv_app/Utilities/variables.dart';

class AccessToken {
  oauth2.Client _client;
/*
  final credentialsFile = File("~/credentialsSss.json");
*/
  getAccessToken(String username, String password) async {
    /*var exists = await credentialsFile.exists();
    */
    final authorizationEndpoint = Uri.parse(restApiUrl + "v2/oauth/token");
    final identifier = "client";
    final secret = "secret";

    try {
      _client = await oauth2.resourceOwnerPasswordGrant(
          authorizationEndpoint, username, password,
          identifier: identifier, secret: secret);
    } on oauth2.AuthorizationException catch (e) {
      print("ACCESS ERROR");
      print(e);
      return accessError;
    } catch (e) {
      print("Error : $e");
    }
    aToken = _client.credentials.accessToken;
    return _client;
  }
}
