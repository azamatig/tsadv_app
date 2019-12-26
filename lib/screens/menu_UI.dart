import 'package:flutter/material.dart';
import 'package:tsadv_app/screens/request_absent/inbox_request_absent.dart';
import 'package:tsadv_app/screens/request_absent/outbox_request_absent.dart';

class HiddenMenuPage extends StatefulWidget {
  _HiddenMenuPageState createState() => _HiddenMenuPageState();
}

class _HiddenMenuPageState extends State<HiddenMenuPage>
    with TickerProviderStateMixin {
  double appbarHeight = 80.0;
  double menuHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Colors.grey.shade600,
              height: menuHeight,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text("Меню",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0))
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              alignment: Alignment.center,
                              child: Text("Профиль",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ))),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => LeaveInboxList())),
                          child: Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              alignment: Alignment.center,
                              child: Text("Входящие запросы",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ))),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LeaveList())),
                          child: Container(
                              padding: EdgeInsets.only(bottom: 10.0),
                              alignment: Alignment.center,
                              child: Text("Исходящие запросы",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                  ))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
