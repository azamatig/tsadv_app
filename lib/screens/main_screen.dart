import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tsadv_app/utils/globalvar.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MainScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexController = StreamController<int>.broadcast();
  int _selectedIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) => indexController.add(index),
          controller: pageController,
          children: <Widget>[
            Center(child: Text("Оплата труда")),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: hexToColor("#3C3C3C"),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                  color: hexToColor("#F9AC19"),
                ),
                title: Text(
                  "Главная",
                  style: TextStyle(
                    color: hexToColor("#F9AC19"),
                  ),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.warning, //exclamationMark
                color: hexToColor("#F9AC19"),
              ),
              title: Text(
                "Новости",
                style: TextStyle(
                  color: hexToColor("#F9AC19"),
                ),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  color: hexToColor("#F9AC19"),
                ),
                title: Text(
                  "Уведомления",
                  style: TextStyle(
                    color: hexToColor("#F9AC19"),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.format_list_numbered,
                  color: hexToColor("#F9AC19"),
                ),
                title: Text(
                  "Обязательства",
                  style: TextStyle(
                    color: hexToColor("#F9AC19"),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance_wallet,
                  color: hexToColor("#F9AC19"),
                ),
                title: Text(
                  "Оплата труда",
                  style: TextStyle(
                    color: hexToColor("#F9AC19"),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

changePage(int index) {
  MainState()._onTap(index);
}
