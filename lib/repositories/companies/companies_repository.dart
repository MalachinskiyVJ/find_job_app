import 'dart:async';

import 'package:dio/dio.dart';
import 'package:find_job/models/add_company_req_model.dart';
import 'package:find_job/models/add_company_resp_model.dart';
import 'package:find_job/models/companies_resp_model.dart';
import 'package:find_job/repositories/companies/base_companies_repository.dart';

class CompaniesRepository implements BaseCompaniesRepository {
  var url = "3.75.134.87";
  var companiesPath = "/flutter/v1/companies";

  @override
  Future<List<Company>?> getAllCompanies() async {
    var uri = Uri.http(url, companiesPath);
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(
      responseHeader: false,
      responseBody: true,
    ));
    var response = await dio.getUri(uri);
    if (response.statusCode == 200) {
      CompaniesRespsonse companiesRespsonse =
          CompaniesRespsonse.fromJson(response.data);
      return companiesRespsonse.company;
    }
    return [];
  }

  @override
  Future<void> addCompany(AddCompanyRequest addCompanyRequest) async {
    var uri = Uri.http(url, companiesPath);
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(
        responseHeader: false, responseBody: true, requestBody: true));
    var response = await dio.postUri(uri, data: addCompanyRequest);
    if (response.statusCode == 200) {
      AddCompanyResponse addCompanyRespsonse =
          AddCompanyResponse.fromJson(response.data);
    }
  }
}
