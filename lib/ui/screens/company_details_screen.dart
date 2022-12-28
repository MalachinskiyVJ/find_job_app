import 'package:find_job/bloc/jobs_bloc/jobs_bloc.dart';
import 'package:find_job/models/companies_resp_model.dart';
import 'package:find_job/models/jobs_resp_model.dart';
import 'package:find_job/repositories/jobs/jobs_repository.dart';
import 'package:find_job/ui/screens/job_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyDetailsScreen extends StatelessWidget {
  const CompanyDetailsScreen({
    Key? key,
    required this.companyData,
  }) : super(key: key);

  static const id = 'company_details_screen';

  final Company companyData;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => JobsRepository(),
      child: BlocProvider(
        create: (context) =>
            JobsBloc(jobsRepository: context.read<JobsRepository>())
              ..add(LoadJobsByCompany(companyData.id ?? 1)),
        child: Scaffold(
            appBar: AppBar(
              title: Text(companyData.name ?? ""),
              centerTitle: true,
              backgroundColor: Colors.lightBlueAccent,
            ),
            body: BlocBuilder<JobsBloc, JobsState>(
              builder: (context, state) {
                if (state is JobsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is JobsLoaded) {
                  List<Job> jobs = state.jobs;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.lightBlueAccent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        width: double.infinity,
                        margin: const EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "name",
                                style: TextStyle(color: Colors.black54),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                companyData.name ?? "",
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 15),
                              const Text("description",
                                  style: TextStyle(color: Colors.black54)),
                              const SizedBox(height: 5),
                              Text(
                                companyData.description ?? "",
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 15),
                              const Text("industry",
                                  style: TextStyle(color: Colors.black54)),
                              const SizedBox(height: 5),
                              Text(
                                companyData.industry ?? "",
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                            "Для компанії ${companyData.name} знайдено ${jobs.length} вакансій",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400)),
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            Job jobInfo = state.jobs[index];
                            return jobsList(jobInfo, context);
                          },
                          separatorBuilder: (_, index) => const SizedBox(
                            height: 5,
                          ),
                          itemCount: jobs.length,
                          shrinkWrap: true,
                        ),
                      ),
                    ],
                  );
                } else if (state is CompaniesError) {
                  return const Center(
                      child: Text("Oops, something went wrong..."));
                }
                return const SizedBox.shrink();
              },
            )),
      ),
    );
  }

  Padding jobsList(Job job, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.orangeAccent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(40)),
        child: ListTile(
          title: Text(
            job.title ?? "",
            // style: const TextStyle(fontSize: 15),
          ),
          subtitle: Text(
            job.city ?? "",
            // style: const TextStyle(fontSize: 25)
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobDetailsScreen(
                          jobData: job,
                        )));
          },
        ),
      ),
    );
  }
}
