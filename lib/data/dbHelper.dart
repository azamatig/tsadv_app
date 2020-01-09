import 'package:tsadv_app/data/rest_ds.dart';
import 'package:tsadv_app/models/db_model.dart';

class FreyaDB {
  FreyaDB() {
    provider = DBProvider.db;
  }

  DBProvider provider;

  Future<Freya> getFreya() async {
    final db = await provider.database;
    var res = await db.query("FREYA");
    Freya item =
        res.isNotEmpty ? res.map((c) => Freya.fromMap(c)).toList()[0] : null;
    return item;
  }

  // ignore: always_declare_return_types
  updateClient(Freya newFreya) async {
    final db = await provider.database;
    var res = await db.update("FREYA", newFreya.toMap(), where: "id = 1");
    return res;
  }

  // ignore: always_declare_return_types
  setPin(String pin) async {
    Freya freya = await getFreya();
    freya.pin = pin;
    return updateClient(freya);
  }

  // ignore: always_declare_return_types
  setUserId(String userId) async {
    Freya freya = await getFreya();
    freya.userId = userId;
    return updateClient(freya);
  }
}
