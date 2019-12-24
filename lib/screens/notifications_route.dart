import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertPage'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('go Back ...'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
