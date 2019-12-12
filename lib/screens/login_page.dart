import 'package:flutter/material.dart';
import 'package:tsadv_app/Utilities/Utilities.dart';
import 'package:tsadv_app/services/auth.dart';
import 'package:tsadv_app/Utilities/variables.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode myFocusNode;

  final formKey = GlobalKey<FormState>();
  String _login;
  String _password;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                ClipPath(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.deepPurple[300],
                  ),
                  clipper: RoundedClipper(60),
                ),
                ClipPath(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.33,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.deepPurpleAccent,
                  ),
                  clipper: RoundedClipper(50),
                ),
                Positioned(
                    top: -110,
                    left: -110,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.height * 0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              (MediaQuery.of(context).size.height * 0.30) / 2),
                          color: Colors.deepPurple[300].withOpacity(0.3)),
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepPurpleAccent),
                        ),
                      ),
                    )),
                Positioned(
                    top: -100,
                    left: 100,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.36,
                      width: MediaQuery.of(context).size.height * 0.36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              (MediaQuery.of(context).size.height * 0.36) / 2),
                          color: Colors.deepPurple[300].withOpacity(0.3)),
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepPurpleAccent),
                        ),
                      ),
                    )),
                Positioned(
                    top: -50,
                    left: 60,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              (MediaQuery.of(context).size.height * 0.15) / 2),
                          color: Colors.deepPurple[300].withOpacity(0.3)),
                    )),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15 - 50),
                  height: MediaQuery.of(context).size.height * 0.33,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        "https://seeklogo.net/wp-content/uploads/2015/08/cortana-vector-logo.png",
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.height * 0.15,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Введите логин и пароль",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 12, 20, 10),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onSaved: (String val) {
                        _login = val;
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "Login",
                        contentPadding: new EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.022,
                            horizontal: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                      ),
                      onFieldSubmitted: (String value) {
                        FocusScope.of(context).requestFocus(myFocusNode);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onSaved: (String val) {
                        _password = val;
                      },
                      focusNode: myFocusNode,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Password",
                        contentPadding: new EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.022,
                            horizontal: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      child: GestureDetector(
                          onTap: () {
                            print("pressed");
                            _pressLogin();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.065,
                            decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Center(
                              child: Text(
                                "ВОЙТИ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
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
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/main', ModalRoute.withName('/'));
      }
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

class RoundedClipper extends CustomClipper<Path> {
  var differenceInHeights = 0;

  RoundedClipper(int differenceInHeights) {
    this.differenceInHeights = differenceInHeights;
  }

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - differenceInHeights);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
