import 'package:sqflite/sqflite.dart';

class BancoDeDados {
  static BancoDeDados? _instance;
  Database? db;

  final String onCreateSQL =
      'create table fotos(id INTEGER PRIMARY KEY AUTOINCREMENT,foto TEXT,titulo TEXT,comentario TEXT,latitude TEXT,longitude TEXT,data TEXT);';

  onCreateFunction(Database db, int version) {
    db.execute(onCreateSQL);
  }

  Future<void> openDb() async {
    if (db == null)
      return await getDatabasesPath().then((value) async {
        String path = value += 'album.db';
        await openDatabase(
          path,
          version: 1,
          onCreate: onCreateFunction,
        ).then((value) {
          db = value;
        });
      });
  }

  BancoDeDados._();

  factory BancoDeDados() {
    return _instance ??= BancoDeDados._();
  }
}