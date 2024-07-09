import 'package:flutter_elo7/business/bloc/base_bloc.dart';
import 'package:flutter_elo7/business/error_codes.dart';
import 'package:flutter_elo7/data/repository/interface/IJobsRepo.dart';
import 'package:flutter_elo7/data/repository/repo/JobsRepoImpl.dart';
import 'package:flutter_elo7/models/dto/jobs/add_jobs_dto.dart';
import 'package:flutter_elo7/utils/exceptions/DataException.dart';
import 'dart:developer';

/*
Classe adaptada do projeto: https://github.com/Anonymousgaurav/bloc_clean_architecture/tree/develop/futter_db
Partes do código pertencem a Gaurav Kumar.
*/
class InsertJobListBloc extends BaseBloc<AddJobsDTO, bool> {
  final IJobsRepo _repo = JobsRepoImpl();
  InsertJobListBloc(initialState);

  @override
  void performOperation(AddJobsDTO dto) async {
    var res;
    try {
      log("performOperation:dto:$dto");
      final data = await _repo.addJobs(dto.jobs);
      res = buildResult(data: data);
      log("performOperation:res:$res");
    } on DataException catch (e) {
      log("inputOperation()", error: e);
      res = buildResult(data: null, code: ErrorCodes.DATA_ERROR);
    } on Exception catch (e) {
      log("inputOperation()", error: e);

      res = buildResult(data: null, code: ErrorCodes.INSERT_DB_ERROR);
    } finally {
      processData(res);
    }
  }
}
