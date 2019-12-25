import 'package:flutter/material.dart';
import 'package:tsadv_app/screens/userInfo/userInfoWidgets.dart';

class ProfileThreePage extends StatefulWidget {
  ProfileThreePage();

  @override
  _ProfileThreePageState createState() => _ProfileThreePageState();
}

class _ProfileThreePageState extends State<ProfileThreePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: getUserInfoWidget(),
    );
  }
}
