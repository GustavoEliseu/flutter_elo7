import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elo7/data/repository/repo/JobsRepoImpl.dart';
import 'package:flutter_elo7/models/network/data_event.dart';
import 'package:flutter_elo7/models/network/data_state.dart';

final class LocalQueryJobsEvent extends DataEvent {
  LocalQueryJobsEvent(this.jobsRepo, this.page, {this.queryTerm});
  JobsRepoImpl jobsRepo;
  int page;
  String? queryTerm;
}

class QueryJobListBloc extends Bloc<DataEvent, DataState> {
  QueryJobListBloc() : super(InitialDataState()) {
    on<LocalQueryJobsEvent>(onQueryJobsEvent);
  }
}

FutureOr<void> onQueryJobsEvent(
    LocalQueryJobsEvent event, Emitter<DataState> emit) async {
  emit(InitialDataState());
  try {
    final response = await event.jobsRepo
        .getActiveJobsPaginated(event.page, queryTerm: event.queryTerm);
    emit(LoadedDataState(response));
  } catch (e) {
    emit(ErrorDataState(error: e.toString()));
  }
}
