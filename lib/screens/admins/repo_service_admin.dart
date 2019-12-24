import 'package:tsadv_app/screens/Admins/DBCreator.dart';
import 'package:tsadv_app/screens/Admins/admin.dart';

class RepositoryServiceTodo {
  static Future<List<Todo>> getAllTodos() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    WHERE ${DatabaseCreator.isDeleted} = 0''';
    final data = await db.rawQuery(sql);
    List<Todo> todos = List();

    for (final node in data) {
      final todo = Todo.fromJson(node);
      todos.add(todo);
    }
    return todos;
  }

  static Future<Todo> getTodo(int id) async {
    //final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    //WHERE ${DatabaseCreator.id} = $id''';
    //final data = await db.rawQuery(sql);

    final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    WHERE ${DatabaseCreator.id} = ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final todo = Todo.fromJson(data.first);
    return todo;
  }

  static Future<void> addTodo(Todo todo) async {
    final sql = '''INSERT INTO ${DatabaseCreator.todoTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.name},
      ${DatabaseCreator.position},
      ${DatabaseCreator.info},
      ${DatabaseCreator.isDeleted}
    )
    VALUES (?,?,?,?,?)''';
    List<dynamic> params = [
      todo.id,
      todo.name,
      todo.position,
      todo.info,
      todo.isDeleted ? 1 : 0
    ];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add todo', sql, null, result, params);
  }

  static Future<void> deleteTodo(Todo todo) async {
    final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.isDeleted} = 1
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [todo.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Delete todo', sql, null, result, params);
  }

  static Future<void> updateTodo(Todo todo) async {
    final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.name} = ? 
    SET ${DatabaseCreator.position} = ?
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [todo.name, todo.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Update todo', sql, null, result, params);
  }

  static Future<int> todosCount() async {
    final data = await db
        .rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.todoTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
