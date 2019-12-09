import 'package:flutter/material.dart';
import 'package:tsadv_app/services/auth.dart';
import 'package:tsadv_app/utils/globalvar.dart';
import 'package:tsadv_app/utils/widget_utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String _login;
  String _password;
  String _grant_type;
  bool _isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/logo.jpeg',
                            ),
                            fit: BoxFit.fill))),
                Text("logoTitle",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 70.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "enterLogin",
                        counterStyle: TextStyle(fontSize: 24)),
                    onSaved: (val) => _login = val,
                    validator: (val) => (val.isEmpty ? "loginValidate" : null),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "enterPassword"),
                    obscureText: true,
                    onSaved: (val) => _password = val,
                    validator: (val) => (val.isEmpty ? "loginValidate" : null),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "loginAgreement",
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Switch(
                          value: _isAgree,
                          onChanged: _agree,
                          activeColor: Colors.deepOrangeAccent,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                _loginButton(),
              ],
            )),
      ),
    );
  }

  void _agree(bool value) => setState(() => _isAgree = value);

  Widget _loginButton() {
    return MaterialButton(
      color: _isAgree ? Colors.deepOrange : Colors.grey,
      onPressed: _isAgree ? _pressLogin : () => {},
      child: Text(
        "signIn",
        style: TextStyle(fontSize: 24.0, color: Colors.white),
      ),
      splashColor: _isAgree ? Colors.deepOrangeAccent : Colors.blueGrey,
      height: MediaQuery.of(context).size.height * 0.135,
      minWidth: MediaQuery.of(context).size.width,
    );
  }

  void _pressLogin() async {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      showDialog(
          context: context,
          builder: (BuildContext context) => waitingScreen(context));
      var client = await Auth().authenticationRest(
        _login,
        _password,
      );
      if (client == accessError) {
        Navigator.of(context).pop();
        badLogin("error", "incorrectSignIn");
        return;
      }
      if (client == connectionTimeCode) {
        Navigator.of(context).pop();
        badLogin("error", "timeOut");
        return;
      }
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("attention"),
              content: Text("wantPin"),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.amber, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0)),
              titleTextStyle: TextStyle(color: Colors.black),
              contentTextStyle: TextStyle(color: Colors.black),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, '/main', ModalRoute.withName('/')),
                    child: Text(
                      "no",
                      style: TextStyle(color: Colors.black),
                    )),
                FlatButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/pin'),
                    child: Text(
                      "yes",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            );
          });
    }
  }

  void badLogin(String title, String subtitle) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return errorAlertDialog(context, title, subtitle);
        });
  }
}
