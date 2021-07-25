import 'package:sqflite/sqflite.dart';

class BancoDeDados {
  static BancoDeDados? _instance;
  Database? db;

  final String onCreateSQL =
      'create table galeria(id INTEGER PRIMARY KEY AUTOINCREMENT,foto BLOB,titulo TEXT,comentario TEXT,latitude TEXT,longitude TEXT,data TEXT);';

  onCreateFunction(Database db, int version) {
    db.execute(onCreateSQL);
  }

  Future<void> openDb() async {
    if (db == null)
      return await getDatabasesPath().then((value) async {
        String path = value += 'album_fotos.db';
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