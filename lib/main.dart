import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsadv_app/screens/login_page.dart';
import 'package:tsadv_app/screens/main_screen.dart';
import 'package:tsadv_app/utils/globalvar.dart';

void main() {
  runApp(MyApp());
}

Future<bool> sharePreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var res = (preferences.getBool("firstSingIn") ?? false);
  return res;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: mainBackgroundColor,
            iconTheme: IconThemeData(color: Colors.black, size: 18, opacity: 1),
            textTheme: TextTheme(
                title: TextStyle(color: Colors.black, fontSize: 18.0))),
      ),
      home: FutureBuilder(
          future: sharePreferences(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data != null &&
                snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                top: true,
                bottom: true,
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Hello.png'),
                                  fit: BoxFit.cover)),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.76,
                                ),
                                Text(
                                  "personalCabinet",
                                  style: TextStyle(
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                ButtonTheme(
                                  minWidth: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  child: RaisedButton(
                                    color: Colors.deepOrange,
                                    splashColor: Colors.orangeAccent,
                                    onPressed: () => {
                                      snapshot.data,
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      )
                                    },
                                    child: Text(
                                      "singInSystem",
                                      style: TextStyle(
                                          fontSize: 24.0, color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
          }),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginScreen(),
        '/main': (BuildContext context) => MainScreen(),
      },
    );
  }
}
