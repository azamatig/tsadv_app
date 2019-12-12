import 'package:tsadv_app/data/rest_ds.dart';
import 'package:tsadv_app/data/sqlHelper.dart';
import 'package:tsadv_app/models/absence_model.dart';

class TestDB {
  DBProvider provider;

  TestDB() {
    provider = DBProvider.db;
  }

  Future<Test> getTest() async {
    final db = await provider.database;
    var res = await db.query("TEST");
    Test item =
        res.isNotEmpty ? res.map((c) => Test.fromMap(c)).toList()[0] : null;
    return item;
  }

  updateInfo(Test test) async {
    final db = await provider.database;
    var res = await db
        .update("TEST", test.toMap(), where: "id = ?", whereArgs: [test.id]);
    return res;
  }

  insertNewInfo(Test test) async {
    final db = await provider.database;
    var table;
    await db
        .query("TEST", where: "id = ?", whereArgs: [test.id])
        .then((val) => {table = val.first ?? null})
        .catchError((_) => table = null);
    if (table != null) {
      var res = await updateInfo(test);
      return res;
    }
    var res = await db.insert("TEST", test.toMap());
    return res;
  }
}
