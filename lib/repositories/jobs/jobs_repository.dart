import 'package:dio/dio.dart';
import 'package:find_job/models/jobs_resp_model.dart';
import 'package:find_job/repositories/jobs/base_jobs_repository.dart';

class JobsRepository implements BaseJobsRepository {
  var url = "3.75.134.87";
  var jobsPath = "/flutter/v1/jobs";
  // var jobsPyCompany = "/flutter/v1/companies/$companyId/jobs/";

  @override
  Future<List<Job>?> getAllJobs() async {
    var uri = Uri.http(url, jobsPath);
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(
      responseHeader: false,
      responseBody: true,
    ));
    var response = await dio.getUri(uri);
    if (response.statusCode == 200) {
      JobsRespsonse companiesRespsonse = JobsRespsonse.fromJson(response.data);
      return companiesRespsonse.job;
    }
    return [];
  }

  @override
  Future<List<Job>?> getJobsByCompanyId(int companyId) async {
    var jobsByCompany = "/flutter/v1/companies/$companyId/jobs/";
    var uri = Uri.http(url, jobsByCompany);
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(
      responseHeader: false,
      responseBody: true,
    ));
    var response = await dio.getUri(uri);
    if (response.statusCode == 200) {
      JobsRespsonse companiesRespsonse = JobsRespsonse.fromJson(response.data);
      return companiesRespsonse.job;
    }
    return [];
  }
}
