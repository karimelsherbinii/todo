import 'package:sqflite/sqflite.dart';

final String tableTodo = 'todo';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnStatus = 'status';
final String columnTime = 'time';
final String columnDate = 'date';
final String columnDescription = 'description';

class Todo {
  int? id;
  String? title;
  String? time;
  String? date;
  String? description;
  bool? status;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnTime: time,
      columnDate: date,
      columnDescription: description,
      columnStatus: status == true ? 1 : 0
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Todo(this.id, this.title, this.status, this.time, this.date,this.description);

  Todo.fromMap(Map map) {
    id = map[columnId];
    title = map[columnTitle];
    status = map[columnStatus] == 1;
     time = map[columnTime];
    date = map[columnDate];
     description = map[columnDescription];

  }
}

class TodoProvider {
  Database? db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableTodo ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnStatus integer not null,
  $columnTime  text not null,
  $columnDate text not null,
  $columnDescription text not null
  )
''');
    });
  }

  Future<Todo> insert(Todo todo) async {
    todo.id = await db!.insert(tableTodo, todo.toMap());
    return todo;
  }

  Future<Todo?> getTodo(int id) async {
    List maps = await db!.query(tableTodo,
        columns: [columnId, columnStatus, columnTitle, columnTime, columnDate, columnDescription],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Todo.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db!.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Todo todo) async {
    return await db!.update(tableTodo, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => db!.close();
}
