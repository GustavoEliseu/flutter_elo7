import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:flutter_elo7/models/job.dart';

void main() {
  final file = File('test_resources/jobs.json');
  //Test Variables
  const String jobJson =
      """{"title":"pessoa desenvolvedora mobile (android e ios)","type":"engenharia","level":"senior","location":null,"is_active": false}""";
  Job job = const Job(
      title: "pessoa desenvolvedora mobile (android e ios)",
      type: "engenharia",
      level: "senior",
      location: "Remoto",
      is_active: false);

  test('JobJson2 fromJson should be equal to job2', () {
    Job mJob = Job.fromJson(jobJson);
    expect(mJob, job);
  });

  test('Load jobs json', () async {
    final json = jsonDecode(await file.readAsString());
    final jobs = json['jobs'];
    final first = jobs.first;

    expect(first['title'], "especialista de fp&a");
  });

  test('Load jobs json', () async {
    final json = jsonDecode(await file.readAsString());
    final jobsJson = json['jobs'];
    List<Job> jobs = [];
    for (var jobJson in jobsJson) {
      jobs.add(Job.fromMap(jobJson));
    }

    expect(jobs.first.title, "especialista de fp&a");
    expect(jobs.length, 12);
  });
}
