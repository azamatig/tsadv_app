import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tsadv_app/screens/Admins/DBCreator.dart';
import 'package:tsadv_app/screens/login_page.dart';
import 'package:tsadv_app/screens/profile_screen.dart';
import 'package:tsadv_app/Utilities/variables.dart';
import 'package:tsadv_app/screens/request_absent/absentDB.dart';

void main() async {
  await DatabaseCreator().initDatabase();
  await DBRequest().initDatabase();
  runApp(MyApp());
}

Future<bool> sharePreferences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  langValue = preferences.getString("langValue");
  if (langValue == null) {
    await preferences.setString("langValue", "ru");
  }
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
                    body: Stack(
                      children: <Widget>[
                        ClipPath(
                          clipper: CustomBackClip(),
                          child: Container(
                            color: Colors.grey.shade400,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Container(
                                height: 400,
                                width: double.infinity,
                                child: pageView(),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Card(
                                elevation: 0.5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Center(
                                              child: Text(
                                                "Название приложения",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Добро пожаловать",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "Нажмите на кнопку чтобы войти в систему",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      height: 1,
                                      color: Colors.grey.shade400,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                60,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            GestureDetector(
                                              child: Text(
                                                "ВОЙТИ",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey,
                                                  fontFamily: "Roboto",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              onTap: () => {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen(),
                                                  ),
                                                )
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            )
                          ],
                        ),
                      ],
                    ),
                  ));
            } else {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
          }),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginScreen(),
        '/main': (BuildContext context) => ProfileThreePage(),
      },
    );
  }
}

Widget pageView() {
  return Swiper(
    containerHeight: 300,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo1.png",
                fit: BoxFit.contain,
                height: 80,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "НАЗВАНИЕ ДЛЯ ОНБОРДИНГА",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lorem ipsum dolar sitLorem \n ipsum dolor sit amet",
                softWrap: true,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      );
    },
    itemCount: 3,
    pagination: SwiperPagination(
      builder: SwiperPagination.dots,
    ),
  );
}

class CustomBackClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
