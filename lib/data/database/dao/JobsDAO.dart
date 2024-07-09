import 'package:flutter_elo7/models/job.dart';
import 'package:flutter_elo7/data/database/AppDatabase.dart';
import 'package:flutter_elo7/data/database/table/JobsTable.dart';

class JobsDAO {
  final AppDatabase dbProvider;

  JobsDAO([AppDatabase? dbProvider])
      : dbProvider = dbProvider ?? AppDatabase.dbProvider;

  Future<List<Job>> getActiveJobsPaginated(int page, String? queryTerm) async {
    String whereTerm = "${JobsTable.JOBS_ACTIVE} =?";
    List<Object?> whereArgs = [1];
    if (queryTerm != null && queryTerm.isNotEmpty) {
      whereTerm += " AND ${JobsTable.JOBS_TITLE} LIKE ?";
      whereArgs.add('%$queryTerm%');
    }
    final db = await dbProvider.database;
    var res = await db.query(JobsTable.JOBS_TABLE_NAME,
        where: whereTerm, whereArgs: whereArgs, offset: page * 3, limit: 3);

    List<Job>? jobs =
        res.isNotEmpty ? res.map((row) => Job.fromMap(row)).toList() : [];

    return jobs.isNotEmpty ? jobs : List.empty();
  }

  Future<bool> addJobs(List<Job> jobs) async {
    final db = await dbProvider.database;
    int result = 0;
    try {
      for (var job in jobs) {
        final id = await db.insert(JobsTable.JOBS_TABLE_NAME, job.toMap());
        if (id != 0) result++;
      }
    } on Exception catch (_) {
      result = 0;
    }

    return result != 0;
  }
}
