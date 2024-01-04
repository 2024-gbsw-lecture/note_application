import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  static final DatabaseClient instance = DatabaseClient();
  late Database _database;

  Future<void> initializeDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}/note.db';

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS note(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            title TEXT,
            content TEXT,
            date TEXT
          )
        ''');
      },
    );
  }
}
