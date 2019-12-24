import 'package:tsadv_app/data/rest_ds.dart';
import 'package:tsadv_app/models/test_user_model.dart';

class UserPersonDB {
  DBProvider provider;

  UserPersonDB() {
    provider = DBProvider.db;
  }

  Future<UserTest> getUser() async {
    final db = await provider.database;
    var res = await db.query("USERINFO");
    UserTest item =
        res.isNotEmpty ? res.map((c) => UserTest.fromMap(c)).toList()[0] : null;
    return item;
  }

  updateInfo(UserTest person) async {
    final db = await provider.database;
    var res = await db.update("USERINFO", person.toMap(),
        where: "id = ?", whereArgs: [person.id]);
    return res;
  }

  insertNewInfo(UserTest person) async {
    final db = await provider.database;
    var table;
    await db
        .query("USERINFO", where: "id = ?", whereArgs: [person.id])
        .then((val) => {table = val.first ?? null})
        .catchError((_) => table = null);
    if (table != null) {
      var res = await updateInfo(person);
      return res;
    }
    var res = await db.insert("USERINFO", person.toMap());
    return res;
  }
}
