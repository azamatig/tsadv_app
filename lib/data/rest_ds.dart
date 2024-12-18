import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tsadv_app/data/sqlHelper.dart';

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
      await db.execute(freya);
      await db.execute(requestList);
      await db.execute(userInfo);
      //  await db.rawInsert(
      //       "INSERT INTO USERINFO(id,firstName,lastName,middleName,position,sex,birthDate,locale,timeZone,name) VALUES (1,'Данияр', 'Ускенбаев','Ердаулетович','Сотрудник','Мужcкой','29.02.1988','Алматы, Казахстан','880229300285','3015')");
      await db.rawInsert(
          "INSERT INTO FREYA(id,login,password,pin,userId) VALUES (1,'null', 'null','null','null')");
    });
  }
}
