import 'package:tsadv_app/screens/request_absent/absentDB.dart';
import 'package:tsadv_app/screens/request_absent/req_model.dart';

class RepositoryServiceReq {
  static Future<List<Reqs>> getAllReqs() async {
    final sql = '''SELECT * FROM ${DBRequest.reqTable}
    WHERE ${DBRequest.isDeleted} = 0''';
    final data = await db.rawQuery(sql);
    List<Reqs> reqs = List();

    for (final node in data) {
      final req = Reqs.fromJson(node);
      reqs.add(req);
    }
    return reqs;
  }

  static Future<Reqs> getReqs(int id) async {
    final sql = '''SELECT * FROM ${DBRequest.reqTable}
    WHERE ${DBRequest.id} = ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final req = Reqs.fromJson(data.first);
    return req;
  }

  static Future<void> addReqs(Reqs reqs) async {
    final sql = '''INSERT INTO ${DBRequest.reqTable}
    (
      ${DBRequest.id},
      ${DBRequest.name},
      ${DBRequest.info},
      ${DBRequest.fromDate},
      ${DBRequest.toDate},
      ${DBRequest.comment},
      ${DBRequest.type},
      ${DBRequest.isDeleted}
    )
    VALUES (?,?,?,?,?,?,?,?)''';
    List<dynamic> params = [
      reqs.id,
      reqs.name,
      reqs.info,
      reqs.fromDate,
      reqs.toDate,
      reqs.comment,
      reqs.type,
      reqs.isDeleted ? 1 : 0
    ];
    final result = await db.rawInsert(sql, params);
    DBRequest.databaseLog('Add todo', sql, null, result, params);
  }

  static Future<void> deleteReqs(Reqs reqs) async {
    final sql = '''UPDATE ${DBRequest.reqTable}
    SET ${DBRequest.isDeleted} = 1
    WHERE ${DBRequest.id} = ?
    ''';

    List<dynamic> params = [reqs.id];
    final result = await db.rawUpdate(sql, params);

    DBRequest.databaseLog('Delete reqs', sql, null, result, params);
  }

  static Future<void> updateReqs(Reqs reqs) async {
    final sql = '''UPDATE ${DBRequest.reqTable}
    SET ${DBRequest.name} = ?
    WHERE ${DBRequest.id} = ?
    ''';

    List<dynamic> params = [reqs.name, reqs.id];
    final result = await db.rawUpdate(sql, params);

    DBRequest.databaseLog('Update reqs', sql, null, result, params);
  }

  static Future<int> reqsCount() async {
    final data =
        await db.rawQuery('''SELECT COUNT(*) FROM ${DBRequest.reqTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
