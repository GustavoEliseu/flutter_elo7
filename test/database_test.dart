import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_elo7/data/database/AppDatabase.dart';
import 'package:flutter_elo7/data/database/table/JobsTable.dart';
import 'package:flutter_elo7/data/repository/repo/JobsRepoImpl.dart';
import 'package:flutter_elo7/models/job.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void sqfliteTestInit() {
  // Initialize ffi implementation
  sqfliteFfiInit();
  // Set global factory
  databaseFactory = databaseFactoryFfi;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteTestInit();
  late AppDatabase appDatabase;
  JobsRepoImpl repo = JobsRepoImpl();
  final file = File('test_resources/jobs.json');
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (MethodCall methodCall) async {
    return '.';
  });
  // Setup sqflite_common_ffi for flutter test
  setUpAll(() async {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory for unit testing calls for SQFlite
    databaseFactory = databaseFactoryFfi;
    appDatabase = repo.jobsDAO.dbProvider;
    appDatabase.clear(await appDatabase.database);
    appDatabase.initDB(await appDatabase.database, 1);

    final json = jsonDecode(await file.readAsString());
    final jobsJson = json['jobs'];
    List<Job> jobs = [];
    for (var jobJson in jobsJson) {
      jobs.add(Job.fromMap(jobJson));
    }
    bool addJobs = await repo.addJobs(jobs);

    expect(addJobs, true);
  });

  tearDownAll(() async {
    appDatabase.clear(await appDatabase.database);
  });

  test('Start Database test', () async {
    Database data = await appDatabase.database;
    expect(data.isOpen, true);

    List<Map<String, Object?>> tableExists =
        await data.query(JobsTable.JOBS_TABLE_NAME);

    expect(tableExists.length, 0);
  });

  test('Add values to Database test and read', () async {
    Database data = await appDatabase.database;

    List<Map<String, Object?>> databaseQuery =
        await data.query(JobsTable.JOBS_TABLE_NAME);
    int databaseSize = databaseQuery.length;
    expect(databaseSize, 12);
  });

  test('Querry Database Paginated', () async {
    List<Job> databaseQuery = await repo.getActiveJobsPaginated(0);
    int databaseSize = databaseQuery.length;
    expect(databaseSize, 3);

    List<Job> databaseQueryPage2 = await repo.getActiveJobsPaginated(1);

    expect(databaseQueryPage2.first.title, "pessoa analista de data analytics");
  });

  test('Querry Database Paginated', () async {
    List<Job> databaseQuery =
        await repo.getActiveJobsPaginated(0, queryTerm: "pessoa");

    expect(databaseQuery.first.title, "pessoa analista de data analytics");

    Database data = await appDatabase.database;

    List<Map<String, Object?>> databaseQuery2 = await data.query(
        '${JobsTable.JOBS_TABLE_NAME} WHERE ${JobsTable.JOBS_TITLE} LIKE "%pessoa%"');
    expect(databaseQuery2.length, 8);
  });
}
