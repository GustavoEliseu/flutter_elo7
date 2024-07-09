// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:flutter_elo7/data/database/table/JobsTable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/*
Classe adaptada do projeto: https://github.com/Anonymousgaurav/bloc_clean_architecture/tree/develop/futter_db
Partes do código pertencem a Gaurav Kumar.
*/
class AppDatabase {
  static final AppDatabase dbProvider = AppDatabase();
  static const DATABASE_NAME = "JOBS_DATABASE.db";
  static const DATABASE_VERSION = 1;

  Database? _database;

  Future<Database> get database async {
    _database ??= await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DATABASE_NAME);

    var database =
        await openDatabase(path, version: DATABASE_VERSION, onCreate: initDB);
    return database;
  }

  void initDB(Database database, int version) async {
    JobsTable.createTable(database, version);
  }

  void clear(Database database) async {
    JobsTable.dropTable(database);
  }
}
