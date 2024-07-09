import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:flutter_elo7/models/job.dart';

void main() {
  final file = File('test_resources/jobs.json');
  //Test Variables
  const String jobJson =
      """{"title":"especialista de fp&a","type":"financeiro","level":"especialista","location":"são paulo, sp, brasil","is_active":true}""";
  const String jobJson2 =
      """{"title":"pessoa desenvolvedora mobile (android e ios)","type":"engenharia","level":"senior","location":null,"is_active": false}""";
  Job job = const Job(
      title: "especialista de fp&a",
      type: "financeiro",
      level: "especialista",
      location: "são paulo, sp, brasil",
      is_active: true);
  Job job2 = const Job(
      title: "pessoa desenvolvedora mobile (android e ios)",
      type: "engenharia",
      level: "senior",
      location: "Remoto",
      is_active: false);

  test('Job toJson should be equal to job', () {
    String json = job.toJson();
    expect(json, jobJson);
  });

  test('job2 toJson should not be equal to job2 due to "Remoto"', () {
    String json = job2.toJson();
    expect(false, json == jobJson2);
  });

  test('JobJson2 fromJson should be equal to job2', () {
    Job mJob = Job.fromJson(jobJson2);
    expect(mJob, job2);
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
