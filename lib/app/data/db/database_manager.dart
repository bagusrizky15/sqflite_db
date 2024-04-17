import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  // private constructor
  DatabaseManager._privateConstructor();
  static DatabaseManager instance = DatabaseManager._privateConstructor();

  Database? _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await _initDb();
      return _db!;
    }
  }

  Future _initDb() async {
    // table database
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, "notes.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        return await database.execute(
          '''
        CREATE TABLE notes (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          title TEXT, 
          subtitle TEXT
        )
        ''');
      },
    );
  }

  Future closeDb() async {
    if (_db != null) {
      await _db!.close();
    }
  }
}
