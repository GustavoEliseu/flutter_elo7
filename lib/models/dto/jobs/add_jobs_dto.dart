import 'package:flutter_elo7/models/dto/base_dto.dart';
import 'package:flutter_elo7/models/job.dart';

class AddJobsDTO extends BaseDTO {
  List<Job> jobs;

  AddJobsDTO({required this.jobs}) : super();
}
