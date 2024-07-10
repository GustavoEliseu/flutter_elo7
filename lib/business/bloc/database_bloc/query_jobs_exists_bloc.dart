import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elo7/data/repository/repo/JobsRepoImpl.dart';
import 'package:flutter_elo7/models/network/data_event.dart';
import 'package:flutter_elo7/models/network/data_state.dart';

final class LocalQueryJobsExistsEvent extends DataEvent {
  LocalQueryJobsExistsEvent(this.jobsRepo);
  JobsRepoImpl jobsRepo;
}

class QueryJobExistBloc extends Bloc<DataEvent, DataState> {
  QueryJobExistBloc() : super(InitialDataState()) {
    on<LocalQueryJobsExistsEvent>(onQueryJobsEvent);
  }
}

FutureOr<void> onQueryJobsEvent(
    LocalQueryJobsExistsEvent event, Emitter<DataState> emit) async {
  emit(InitialDataState());
  try {
    await event.jobsRepo.checkIfThereAreLocalJobs().then((value) {
      emit(LoadedDataState(value));
    }).catchError((error) {
      emit(ErrorDataState(error: error.toString()));
    });
  } catch (e) {
    emit(ErrorDataState(error: e.toString()));
  }
}
