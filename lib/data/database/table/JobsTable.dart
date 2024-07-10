// ignore_for_file: constant_identifier_names

import 'package:sqflite/sqflite.dart';

class JobsTable {
  static const String JOBS_TABLE_NAME = "JOBS_TABLE";
  static const String JOBS_ID = "id";
  static const String JOBS_TITLE = "title";
  static const String JOBS_TYPE = "type";
  static const String JOBS_LEVEL = "level";
  static const String JOBS_LOCATION = "location";
  static const String JOBS_ACTIVE = "is_active";

  static void createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $JOBS_TABLE_NAME (
        $JOBS_ID INTEGER NOT NULL,
        $JOBS_TITLE TEXT NOT NULL,
        $JOBS_TYPE TEXT NOT NULL,
        $JOBS_LEVEL TEXT NOT NULL,
        $JOBS_LOCATION TEXT NOT NULL,
        $JOBS_ACTIVE INTEGER NOT NULL,
        PRIMARY KEY ($JOBS_ID)
      )
    ''');
  }

  static void dropTable(Database database) async {
    await database.execute('''DROP TABLE IF EXISTS $JOBS_TABLE_NAME''');
  }
}
