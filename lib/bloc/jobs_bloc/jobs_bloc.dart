import 'package:equatable/equatable.dart';
import 'package:find_job/models/jobs_resp_model.dart';
import 'package:find_job/repositories/jobs/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobsRepository _jobsRepository;

  JobsBloc({required JobsRepository jobsRepository})
      : _jobsRepository = jobsRepository,
        super(JobsLoading()) {
    on<LoadJobs>(_onLoadJobs);
    on<LoadJobsByCompany>(_onLoadJobsByCompany);
  }

  Future<void> _onLoadJobs(JobsEvent event, Emitter<JobsState> emit) async {
    emit(JobsLoading());
    try {
      final List<Job>? jobs = await _jobsRepository.getAllJobs();
      emit(JobsLoaded(jobs: jobs ?? []));
    } catch (_) {
      emit(CompaniesError());
    }
  }

  Future<void> _onLoadJobsByCompany(
      LoadJobsByCompany event, Emitter<JobsState> emit) async {
    emit(JobsLoading());
    try {
      final List<Job>? jobs =
          await _jobsRepository.getJobsByCompanyId(event.companyId);
      emit(JobsLoaded(jobs: jobs ?? []));
    } catch (_) {
      emit(CompaniesError());
    }
  }
}
