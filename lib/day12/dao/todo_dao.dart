import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../bean/todo_bean.dart';
import 'package:path/path.dart';

class TodoDao {
  //私有化构 类名._()，实现单例，外界无法创建此类对象，通过db静态变量创建当前对象暴露于外界，即可实现单例；
  TodoDao._();

  //提供实例
  static final TodoDao db = TodoDao._();

  static const db_name = "todo.db";
  static const String sql_create_table = """
  CREATE TABLE IF NOT EXISTS todo(
     id INTEGER PRIMARY KEY,
     title VARCHAR(60),
     content TEXT,
     create_time TIMESTAMP,
     start_time TIMESTAMP,
     end_time TIMESTAMP,
     color CHAR(10),
     done SMALLINT,
     icon INT
     );""";
  Database _database;
  Future<Database> get database async => _database ?? await initDB();

  //初始化数据库
  Future<Database> initDB() async {
    //初始化绑定
    WidgetsFlutterBinding.ensureInitialized();
    //获取数据库路径
    String path = join(await getDatabasesPath(), db_name);
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (db) => print("数据库-----onOpen"),
      onUpgrade: (db,old,now)=> print("数据库----onUpgrade"),
      onCreate: (Database  db, int version) async {
        print("数据库----onCreate");
        await db.execute(sql_create_table);
      },
    );
    return database;
  }

  Future<void> insertTestData async {
    var now = DateTime.now().microsecondsSinceEpoch;
    var aDay = 24*60*60*1000;
    var aHour = 24*60*60*1000;
  TodoBean bean = TodoBean(
      todoTitle: "修复音乐播放器bug",
      todoContent: "播放顺序错乱，周五之前搞定。",
      todoColor: "0xffd14d52",
      todoCreateTime: now,
      todoStartTime: now + aDay,
      todoEndTime: now + 3 * aDay,
      todoIcon: 1);
  TodoBean bean2 = TodoBean(
      todoTitle: "开源FlutterUnit",
      todoContent: "第一个大的开源项目，集合Flutter的所有Widget,并添加可操作性，为新手学习提供参考。",
      todoColor: "0xffd14d52",
      todoCreateTime: now - aDay,
      todoStartTime: now + 2 * aDay,
      todoEndTime: now + 30 * aDay,
      todoIcon: 0);

  TodoBean bean3 = TodoBean(
      todoTitle: "写一首歌",
      todoContent: "我就是琴棋书画，样样精通的美少年。",
      todoColor: "0xff3855d1",
      todoCreateTime: now,
      todoStartTime: now - aDay,
      todoEndTime: now + 3 * aDay,
      todoIcon: 3);

  TodoBean bean4 = TodoBean(
      todoTitle: "约会",
      todoContent: "这周六，溪水兰亭，不见不散。",
      todoColor: "0xffd1d08f",
      todoCreateTime: now + aDay,
      todoStartTime: now - 3 * aDay,
      todoEndTime: now - 2 * aDay,
      todoIcon: 9,
      todoDone: 1);

  TodoBean bean5 = TodoBean(
      todoTitle: "买把吉他",
      todoContent: "习音律，入魔道。",
      todoColor: "0xff34d14c",
      todoCreateTime: now,
      todoStartTime: now + aDay,
      todoEndTime: now + 2 * aDay,
      todoIcon: 15);

//    TodoBean bean6= TodoBean(todoTitle: "约会",todoContent: "七月初七，淮水竹亭，不见不散。",todoColor: "#e7fcc9",todoCreateTime: now,todoStartTime: now-aHour,todoEndTime: now+aDay,todoIcon: 1);

  await TodoDao.db.insert(bean);
  await TodoDao.db.insert(bean2);
  await TodoDao.db.insert(bean3);
  await TodoDao.db.insert(bean4);
  await TodoDao.db.insert(bean5);
}

Future<void> insert(TodoBean todo) async {
    final db = await database;
    String add_sql = //插入数据
        "INSERT INTO "
        "todo(title,content,create_time,start_time,end_time,color,done,icon) "
        "VALUES (?,?,?,?,?,?,?,?);";
    await db.transaction((tran) async {
      await tran.rawInsert(add_sql, [
        todo.todoTitle,
        todo.todoContent,
        todo.todoCreateTime,
        todo.todoStartTime,
        todo.todoEndTime,
        todo.todoColor,
        todo.todoDone,
        todo.todoIcon
      ]);
    });
    return db.close();
}

//修改数据方法
Future update(TodoBean newTodo) async {
  //数据库
  final db = await database;
  String sql = "UPDATE todo "
      "SET title = ?,content = ?,create_time = ? ,start_time = ?,end_time = ?,color = ? ,done = ? ,icon = ?"
      "WHERE id = ?";
  await db.transaction((tran) async {
    await tran.rawUpdate(sql, [
      newTodo.todoTitle,
      newTodo.todoContent,
      newTodo.todoCreateTime,
      newTodo.todoStartTime,
      newTodo.todoEndTime,
      newTodo.todoColor,
      newTodo.todoDone,
      newTodo.todoIcon,
      newTodo.todoId
    ]);
  });
  return db.close();
}

//查询数据方法
Future<List<Map>> queryAll() async {
  final db = await database;
  //将数据放到集合里面显示
  List<Map> dataList =
  await db.rawQuery("SELECT * FROM todo ORDER BY id DESC");
  await db.close();
  return dataList;
}

//查询数据方法
Future<List<Map>> query({bool desc = true, String where = "1"}) async {
  final db = await database;
  //将数据放到集合里面显示
  List<Map> dataList = await db.rawQuery(
      "SELECT * FROM todo WHERE ${where} ORDER BY create_time ${desc ? "DESC" : "ASC"}");
  await db.close();
  return dataList;
}

//删除数据方法
Future<void> delete(int id) async {
  final db = await database;
  String sql = "DELETE FROM todo WHERE id = ?";
  await db.transaction((tran) async {
    await tran.rawDelete(sql, [id]);
  });
  await db.close();
}

//删除数据方法
Future<void> done(int id) async {
  final db = await database;
  String sql = "UPDATE todo "
      "SET done = 1 "
      "WHERE id = ?";
  await db.transaction((tran) async {
    await tran.rawUpdate(sql, [id]);
  });
  await db.close();
}

///通过加上百分号，进行模糊查询
Future<List<Map>> search(String query) async {
  final db = await database;
  final sql = "SELECT * FROM todo WHERE ("
      "title LIKE ? "
      "OR content LIKE ? "
      ")";

  return await db.rawQuery(sql, [
    "%$query%",
    "%$query%",
  ]);
}

}
