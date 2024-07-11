import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elo7/data/repository/repo/JobsRepoImpl.dart';
import 'package:flutter_elo7/models/job.dart';
import 'package:flutter_elo7/models/network/data_state.dart';

class InsertJobsBloc extends Cubit<DataState> {
  InsertJobsBloc(super.initialState);

  insertJobs(JobsRepoImpl jobsRepo, List<Job> jobs) async {
    emit(InitialDataState());
    try {
      final response = await jobsRepo.addJobs(jobs);
      emit(LoadedDataState(response));
    } catch (e) {
      emit(ErrorDataState(error: e.toString()));
    }
  }
}
