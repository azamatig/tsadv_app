import 'package:flutter/material.dart';

class AbsenceList extends StatefulWidget {
  AbsenceList();

  @override
  _AbsenceListState createState() => _AbsenceListState();
}

class _AbsenceListState extends State<AbsenceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBar,
    );
  }

  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Colors.white,
    title: Center(child: Text('Запросы')),
  );
}
