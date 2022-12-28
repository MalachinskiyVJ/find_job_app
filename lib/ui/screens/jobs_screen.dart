import 'package:find_job/bloc/jobs_bloc/jobs_bloc.dart';
import 'package:find_job/models/jobs_resp_model.dart';
import 'package:find_job/repositories/jobs/jobs_repository.dart';
import 'package:find_job/ui/screens/job_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsScreen extends StatelessWidget {
  JobsScreen({Key? key}) : super(key: key);

  final jobsRepository = JobsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobsBloc, JobsState>(
      builder: (context, state) {
        if (state is JobsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is JobsLoaded) {
          List<Job> jobs = state.jobs;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Всього знайдено ${jobs.length} результатів",
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
          return const Center(child: Text("Oops, something went wrong..."));
        }
        return const SizedBox.shrink();
      },
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
          ),
          subtitle: Text(
            job.city ?? "",
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
