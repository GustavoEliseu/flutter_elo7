import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elo7/data/repository/repo/JobsRepoImpl.dart';
import 'package:flutter_elo7/models/network/data_state.dart';

class QueryJobListBloc extends Cubit<DataState> {
  QueryJobListBloc() : super(InitialDataState());
  onQueryJobsEvent(JobsRepoImpl jobsRepo, int page, {String? queryTerm}) async {
    emit(InitialDataState());
    try {
      final response =
          await jobsRepo.getActiveJobsPaginated(page, queryTerm: queryTerm);
      emit(LoadedDataState(response));
    } catch (e) {
      emit(ErrorDataState(error: e.toString()));
    }
  }
}
