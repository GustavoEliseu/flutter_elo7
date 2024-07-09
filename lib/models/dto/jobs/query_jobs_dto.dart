import 'package:flutter_elo7/models/dto/base_dto.dart';

class QueryJobsDTO extends BaseDTO {
  String? queryTerm;
  int page;

  QueryJobsDTO({required this.page, this.queryTerm}) : super();
}
