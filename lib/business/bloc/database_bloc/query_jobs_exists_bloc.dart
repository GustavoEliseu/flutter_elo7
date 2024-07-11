import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elo7/data/repository/repo/JobsRepoImpl.dart';
import 'package:flutter_elo7/models/network/data_state.dart';

class QueryJobExistBloc extends Cubit<DataState> {
  QueryJobExistBloc() : super(InitialDataState());

  onQueryJobs(JobsRepoImpl jobsRepo) async {
    emit(InitialDataState());
    try {
      final response = await jobsRepo.checkIfThereAreLocalJobs();
      emit(LoadedDataState(response));
    } catch (e) {
      emit(ErrorDataState(error: e.toString()));
    }
  }
}
