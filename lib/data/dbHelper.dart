import 'package:tsadv_app/data/rest_ds.dart';
import 'package:tsadv_app/models/db_model.dart';

class TimelyDB {
  TimelyDB() {
    provider = DBProvider.db;
  }

  DBProvider provider;

  Future<Timely> getTimely() async {
    final db = await provider.database;
    var res = await db.query("TIMELY");
    Timely item =
        res.isNotEmpty ? res.map((c) => Timely.fromMap(c)).toList()[0] : null;
    return item;
  }

  // ignore: always_declare_return_types
  updateClient(Timely newTimely) async {
    final db = await provider.database;
    var res = await db.update("TIMELY", newTimely.toMap(), where: "id = 1");
    return res;
  }

  // ignore: always_declare_return_types
  setPin(String pin) async {
    Timely timely = await getTimely();
    timely.pin = pin;
    return updateClient(timely);
  }

  // ignore: always_declare_return_types
  setUserId(String userId) async {
    Timely timely = await getTimely();
    timely.userId = userId;
    return updateClient(timely);
  }
}
