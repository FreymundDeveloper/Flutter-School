import 'package:sqflite/sqflite.dart';

class BancoDeDados {
  static BancoDeDados? _instance;
  Database? db;

  final String onCreateSQL =
      'create table contatos(id INTEGER PRIMARY KEY AUTOINCREMENT,nome TEXT,telefone TEXT,email TEXT);';

  onCreateFunction(Database db, int version) {
    db.execute(onCreateSQL);
  }

  Future<void> openDb() async {
    if (db == null)
      return await getDatabasesPath().then((value) async {
        String path = value += 'contato.db';
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