import 'package:flutter_elo7/models/job.dart';

abstract class IJobsRepo {
  Future<bool> addJobs(List<Job> jobs);
  Future<bool> checkIfThereAreLocalJobs();
  Future<List<Job>> getActiveJobsPaginated(int page, {String? queryTerm});
}
