import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tsadv_app/utils/globalvar.dart';

Widget errorAlertDialog(var context, String title, String content) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(4.0)),
    titleTextStyle: TextStyle(color: Colors.black),
    contentTextStyle: TextStyle(color: Colors.black),
    actions: <Widget>[
      FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Закрыть",
            style: TextStyle(color: Colors.black),
          ))
    ],
  );
}

Widget warningAlertDialog(var context, String title, String content) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.amber, width: 2.0),
        borderRadius: BorderRadius.circular(4.0)),
    titleTextStyle: TextStyle(color: Colors.black),
    contentTextStyle: TextStyle(color: Colors.black),
    actions: <Widget>[
      FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "ОК",
            style: TextStyle(color: Colors.black),
          ))
    ],
  );
}

Widget waitingScreen(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(color: Colors.orange),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: CircularProgressIndicator(
        semanticsLabel: "Ожидание",
        backgroundColor: Colors.white,
      )),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget DropdownListItem(String title, String subTitle) {
  return Container(
    child: ListTile(
      title: Text(
        title + ":",
        style: TextStyle(color: Colors.black, fontSize: 14.0),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(fontSize: 18.0),
      ),
    ),
  );
}

Widget customListTile(String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0, top: 10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            subtitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}

Widget corpusForExpansionTile(Widget widget) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        decoration: BoxDecoration(
            color: mainBackgroundColor,
            borderRadius: BorderRadius.circular(18)),
        child: widget),
  );
}

// ignore: missing_return
Future<bool> checkConnection() async {
  try {
    final result = await InternetAddress.lookup('192.168.88.94:8085/tsadv');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}

createCardElement(Widget childWidget,
    {Color color, double elevation, BoxConstraints constraints}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      constraints: constraints,
      child: Card(
          semanticContainer: true,
          color: color != null ? color : mainBackgroundColor,
          elevation: elevation != null ? elevation : 5,
          margin: EdgeInsets.all(8.0),
          child: childWidget),
    ),
  );
}

contain(List list, dynamic f) {
  for (dynamic e in list) {
    if (e.id == f.id) {
      return true;
    }
  }
  return false;
}
