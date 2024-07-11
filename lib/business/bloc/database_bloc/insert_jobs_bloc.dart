import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elo7/data/repository/repo/JobsRepoImpl.dart';
import 'package:flutter_elo7/models/job.dart';
import 'package:flutter_elo7/models/network/data_event.dart';
import 'package:flutter_elo7/models/network/data_state.dart';

class InsertingJobsEvent extends DataEvent {
  InsertingJobsEvent(this.jobsRepo, this.jobs);
  JobsRepoImpl jobsRepo;
  List<Job> jobs;
}

class InsertJobsBloc extends Bloc<DataEvent, DataState> {
  InsertJobsBloc() : super(InitialDataState()) {
    on<InsertingJobsEvent>(onInsertJobsEvent);
  }
}

FutureOr<void> onInsertJobsEvent(
    InsertingJobsEvent event, Emitter<DataState> emit) async {
  emit(InitialDataState());
  try {
    final response = await event.jobsRepo.addJobs(event.jobs);
    emit(LoadedDataState(response));
  } catch (e) {
    emit(ErrorDataState(error: e.toString()));
  }
}
