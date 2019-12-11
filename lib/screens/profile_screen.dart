import 'package:flutter/material.dart';
import 'package:tsadv_app/screens/absent_create.dart';
import 'package:tsadv_app/screens/userInfo/user_screen.dart';
import 'package:tsadv_app/utils/PNetwork.dart';

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
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: 350,
                width: double.infinity,
                child: PNetworkImage(
                  'https://i.pinimg.com/originals/8b/c0/5b/8bc05b293a4d30c615be694b3fa87954.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 225.0, 16.0, 16.0),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.only(top: 16.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 96.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          'User',
                                          style:
                                              Theme.of(context).textTheme.title,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Name',
                                          style:
                                              Theme.of(context).textTheme.title,
                                        ),
                                      ],
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Text('Developer'),
                                      subtitle: Text('Almaty, KZ'),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black26,
                              ),
                              SizedBox(height: 5.0),
                              Center(child: Text('Мои отсутствия')),
                              SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  CreatePostScreen(),
                                            ),
                                          ),
                                          color: Colors.green,
                                          icon: Icon(Icons.add_circle_outline),
                                        ),
                                        Text("Создать запрос"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => null)),
                                          color: Colors.red,
                                          icon: Icon(Icons.date_range),
                                        ),
                                        Text("Мои запросы"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        IconButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      TestScreen())),
                                          color: Colors.blueAccent,
                                          icon: Icon(Icons.edit),
                                        ),
                                        Text("Профиль"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.pinimg.com/originals/8b/c0/5b/8bc05b293a4d30c615be694b3fa87954.jpg'),
                                  fit: BoxFit.cover)),
                          margin: EdgeInsets.only(left: 16.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text("Общая информация"),
                          ),
                          Divider(),
                          ListTile(
                            title: Text("Email"),
                            subtitle: Text('azerbaev87@gmail.com'),
                            leading: Icon(Icons.email),
                          ),
                          ListTile(
                            title: Text("Телефон"),
                            subtitle: Text('+77078332141'),
                            leading: Icon(Icons.phone),
                          ),
                          ListTile(
                            title: Text("Адрес"),
                            subtitle: Text('Кабанбай батыра 236'),
                            leading: Icon(Icons.location_on),
                          ),
                          ListTile(
                            title: Text('О себе'),
                            subtitle: Text('По себе не судят'),
                            leading: Icon(Icons.person),
                          ),
                          ListTile(
                            title: Text('Пол'),
                            subtitle: Text("Мужской"),
                            leading: Icon(Icons.person_outline),
                          ),
                          ListTile(
                            title: Text('Дата рождения'),
                            subtitle: Text("22.11.1987"),
                            leading: Icon(Icons.date_range),
                          ),
                          ListTile(
                            title: Text("Дата выхода на работу "),
                            subtitle: Text("20.01.2019"),
                            leading: Icon(Icons.calendar_view_day),
                          ),
                          FlatButton(
                            onPressed: () => Navigator.maybePop(context),
                            child: Text('ВЫЙТИ'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              )
            ],
          ),
        ));
  }
}
