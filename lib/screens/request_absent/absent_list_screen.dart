import 'package:flutter/material.dart';
import 'package:tsadv_app/models/user_model.dart';
import 'package:tsadv_app/screens/request_absent/absentList.dart';

class LeaveList extends StatefulWidget {
  final User user;

  LeaveList({
    this.user,
  });

  @override
  _LeaveListState createState() => _LeaveListState();
}

class _LeaveListState extends State<LeaveList> {
  // ignore: unused_field
  String _users;

  @override
  void initState() {
    super.initState();
  }

  TextEditingController _searchController = TextEditingController();

  _clearSearch() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _searchController.clear());
    setState(() {
      _users = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              border: InputBorder.none,
              hintText: 'Поиск',
              prefixIcon: Icon(
                Icons.search,
                size: 30.0,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear,
                ),
                onPressed: _clearSearch,
              ),
              filled: true,
            ),
            onSubmitted: (input) {
              if (input.isNotEmpty) {
                setState(() {
                  //      _users = DBProvider.searchUsers(input);
                });
              }
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text('Исходящие запросы'),
              SizedBox(
                height: 10,
              ),
              Expanded(child: AbsentCRUD()),
            ],
          ),
        ));
  }
}
