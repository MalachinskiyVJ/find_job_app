import 'package:find_job/models/add_job_req_model.dart';
import 'package:find_job/models/jobs_resp_model.dart';

abstract class BaseJobsRepository {
  Future<List<Job>?> getAllJobs() async {}

  Future<List<Job>?> getJobsByCompanyId(int companyId) async {}

  Future<void> addJob(AddJobRequest addCompanyRequest) async {}
}
