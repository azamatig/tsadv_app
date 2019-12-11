import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tsadv_app/data/sql.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(tasks);
      await db.execute(timely);
      await db.execute(carOrder);
      await db.execute(savedAddress);
      await db.execute(test);
      await db.execute(assignment);
      await db.execute(antropometry);
      await db.execute(userInfo);
      await db.execute(notification);
      await db.execute(news);
      await db.execute(placement);
      await db.execute(ppe);
      await db.execute(events);
      await db.execute(testingGraphic);
      await db.rawInsert(
          "INSERT INTO TIMELY(id,login,password,pin,userId) VALUES (1,'null', 'null','null','null')");
      await db.rawInsert(
          "INSERT INTO TESTING_GRAPHIC(id,userId,graphic) VALUES (1,'null', 'null')");
    });
  }
}
