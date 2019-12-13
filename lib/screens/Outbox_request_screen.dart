import 'package:flutter/material.dart';
import 'package:tsadv_app/models/user_info_model.dart';
import 'package:tsadv_app/models/user_model.dart';
import 'package:tsadv_app/screens/edit_profile_screen.dart';

class OutboxList extends StatefulWidget {
  final User user;
  final String currentUserId;
  final String userId;

  static final String id = 'feed_screen';
  final String postImage;
  final String postName;
  final String postDesc;
  final String status;
  final String type;
  final String caption;
  final String fromDate;
  final String toDate;

  OutboxList(
      {this.userId,
      this.postImage,
      this.postDesc,
      this.postName,
      this.user,
      this.currentUserId,
      this.status,
      this.type,
      this.caption,
      this.fromDate,
      this.toDate});

  @override
  _OutboxListState createState() => _OutboxListState();
}

class _OutboxListState extends State<OutboxList> {
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
        body: _myListView(context));
  }
}

Widget _myListView(BuildContext context) {
  final titles = [
    'bike',
    'boat',
    'bus',
    'car',
    'railway',
    'run',
    'subway',
    'transit',
    'walk'
  ];

  final icons = [
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_bus,
    Icons.directions_car,
    Icons.directions_railway,
    Icons.directions_run,
    Icons.directions_subway,
    Icons.directions_transit,
    Icons.directions_walk
  ];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card(
        //                           <-- Card widget
        child: ListTile(
          leading: Icon(icons[index]),
          title: Text(titles[index]),
        ),
      );
    },
  );
}

Container buildItem() {
  UserPerson person;
  return Container(
    child: Card(
      elevation: 10,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // Верхняя часть карточки с именем победителя
              color: Colors.deepPurple,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 3.0, 13.0, 0.0),
                          child: Text(
                            '1',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                // Название розыгрыша
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 2.0),
                child: Text(
                  'Карточка заявления',
                  style: TextStyle(fontSize: 24, color: Colors.black45),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              // Описание в середине карточки
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Тип заявления: ',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              // Описание в середине карточки
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Комментарий: ',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(),
            Padding(
              // Описание в середине карточки
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Дата начала: ',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              // Описание в середине карточки
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Дата окончания: ',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              // Описание в середине карточки
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Статус заявления: ',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Divider(),
            Row(
              // Buttons here
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 10.0),
                  child: Container(
                    width: 180,
                    height: 43,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () => EditProfileScreen(person),
                      child: Text(
                        'Отклонить',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 10.0),
                  child: Container(
                    width: 180,
                    height: 43,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () => (1),
                      child: Text(
                        'Одобрить',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
