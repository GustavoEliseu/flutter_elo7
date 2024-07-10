import 'package:flutter_elo7/data/database/dao/JobsDAO.dart';
import 'package:flutter_elo7/data/repository/interface/IJobsRepo.dart';
import 'package:flutter_elo7/models/job.dart';

class JobsRepoImpl implements IJobsRepo {
  JobsRepoImpl();

  final JobsDAO jobsDAO = JobsDAO();

  @override
  Future<bool> addJobs(List<Job> jobs) async {
    return await jobsDAO.addJobs(jobs);
  }

  @override
  Future<List<Job>> getActiveJobsPaginated(int page,
      {String? queryTerm}) async {
    return await jobsDAO.getActiveJobsPaginated(page, queryTerm);
  }

  @override
  Future<bool> checkIfThereAreLocalJobs() async {
    return await jobsDAO.checkIfThereAreLocalJobs();
  }
}
