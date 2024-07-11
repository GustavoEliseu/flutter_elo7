import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elo7/data/dio_client.dart';
import 'package:flutter_elo7/models/job.dart';
import 'package:flutter_elo7/models/network/data_event.dart';
import 'package:flutter_elo7/models/network/data_state.dart';

final class RequestJobsEvent extends DataEvent {}

class RequestJobsBloc extends Bloc<DataEvent, DataState> {
  final DioClient client = DioClient();
  RequestJobsBloc() : super(InitialDataState()) {
    on<RequestJobsEvent>(onRequestJobsEvent);
  }

  FutureOr<void> onRequestJobsEvent(
      RequestJobsEvent event, Emitter<DataState> emit) async {
    emit(InitialDataState());
    try {
      var client = DioClient();
      final response =
          await client.dio.get("https://img.elo7.com.br/mock-vagas.json");
      final jobs = (response.data["jobs"] as List<dynamic>)
          .map((x) => Job.fromMap(x))
          .toList();
      emit(LoadedDataState(jobs));
    } catch (e) {
      emit(ErrorDataState(error: e.toString()));
    }
  }
}
