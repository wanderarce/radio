import 'package:path/path.dart';
import 'package:radio/app/modules/entities/radios.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late final database;

  start() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'radios.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE radios(id INTEGER PRIMARY KEY, name TEXT ,  url TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  store(String name, String url) async {
    final db = await start();
    Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = name;
    data["url"] = url;
    var res = await db.insert('radios', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  update(Radios radio) async {
    final db = await start();
    await db.rawUpdate('UPDATE radios SET name = ?, url = ? WHERE id = ?',
        [radio.name!, radio.url!, radio.id!]);
  }

  Future<List<dynamic>> list() async {
    final db = await start();
    final List<Map<String, dynamic>> maps = await db.query('radios');
    print(maps);
    return maps;
  }

  Future<void> delete(int id) async {
    final db = await start();

    await db.delete(
      'radio',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  clearDatabase() async {
    final db = await start();
    await db.delete('radios');
  }
}
