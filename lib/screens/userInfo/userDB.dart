import 'package:tsadv_app/data/rest_ds.dart';
import 'package:tsadv_app/models/user_info_model.dart';

class UserPersonDB {
  DBProvider provider;

  UserPersonDB() {
    provider = DBProvider.db;
  }

  Future<UserPerson> getUser() async {
    final db = await provider.database;
    var res = await db.query("USERINFO");
    UserPerson item = res.isNotEmpty
        ? res.map((c) => UserPerson.fromMap(c)).toList()[0]
        : null;
    return item;
  }

  updateInfo(UserPerson person) async {
    final db = await provider.database;
    var res = await db.update("USERINFO", person.toMap(),
        where: "id = ?", whereArgs: [person.id]);
    return res;
  }

  insertNewInfo(UserPerson person) async {
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
