import 'package:find_job/models/add_company_req_model.dart';
import 'package:find_job/models/companies_resp_model.dart';

abstract class BaseCompaniesRepository {
  Future<List<Company>?> getAllCompanies() async {}

  Future<void> addCompany(AddCompanyRequest addCompanyRequest) async {}
}
