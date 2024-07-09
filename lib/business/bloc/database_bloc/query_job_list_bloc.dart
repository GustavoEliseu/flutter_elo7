import 'dart:developer';

import 'package:flutter_elo7/business/bloc/base_bloc.dart';
import 'package:flutter_elo7/business/error_codes.dart';
import 'package:flutter_elo7/data/repository/interface/IJobsRepo.dart';
import 'package:flutter_elo7/data/repository/repo/JobsRepoImpl.dart';
import 'package:flutter_elo7/models/dto/jobs/query_jobs_dto.dart';
import 'package:flutter_elo7/models/dto/resources_result.dart';
import 'package:flutter_elo7/models/job.dart';
import 'package:flutter_elo7/utils/exceptions/DataException.dart';

class QueryJobListBloc extends BaseBloc<QueryJobsDTO, List<Job>> {
  final IJobsRepo _repo = JobsRepoImpl();
  QueryJobListBloc(initialState);

  @override
  void performOperation(QueryJobsDTO dto) async {
    ResourceResult<List<Job>>? res;
    try {
      log("performOperation:dto:$dto");
      final data = await _repo.getActiveJobsPaginated(dto.page,
          queryTerm: dto.queryTerm);
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
