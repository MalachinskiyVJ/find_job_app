import 'package:find_job/bloc/companies_bloc/companies_bloc.dart';
import 'package:find_job/models/companies_resp_model.dart';
import 'package:find_job/repositories/companies/companies_repository.dart';
import 'package:find_job/ui/screens/company_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesScreen extends StatelessWidget {
  CompaniesScreen({Key? key}) : super(key: key);

  final companiesRepository = CompaniesRepository();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompaniesBloc, CompaniesState>(
      builder: (context, state) {
        if (state is CompaniesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CompaniesLoaded) {
          // List<Company> companies = state.companies;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    "Всього знайдено ${state.companies.length} результатів",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400)),
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    Company companyInfo = state.companies[index];
                    return listElement(companyInfo, context);
                  },
                  separatorBuilder: (_, index) => const SizedBox(
                    height: 5,
                  ),
                  itemCount: state.companies.length,
                  shrinkWrap: true,
                ),
              ),
            ],
          );
        } else if (state is CompaniesError) {
          return const Center(child: Text("Oops, something went wrong..."));
        }
        return const SizedBox.shrink();
      },
    );
  }

  Padding listElement(Company company, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightBlueAccent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(40)),
            child: ListTile(
              title: Text(
                company.name ?? "",
              ),
              subtitle: Text(
                company.industry ?? "",
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CompanyDetailsScreen(
                              companyData: company,
                            )));
              },
            )));
  }
}
