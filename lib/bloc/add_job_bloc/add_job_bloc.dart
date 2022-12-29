import 'package:equatable/equatable.dart';
import 'package:find_job/models/add_job_req_model.dart';
import 'package:find_job/repositories/jobs/jobs_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_job_event.dart';
part 'add_job_state.dart';

class AddJobBloc extends Bloc<AddJobEvent, AddJobState> {
  final JobsRepository _jobsRepository;

  AddJobBloc({required JobsRepository jobsRepository})
      : _jobsRepository = jobsRepository,
        super(AddJobLoading()) {
    on<AddJob>(_onAddCompany);
  }

  Future<void> _onAddCompany(AddJob event, Emitter<AddJobState> emit) async {
    emit(AddJobLoading());
    try {
      await _jobsRepository.addJob(event.addJobRequest);
      emit(AddJobSuccess());
    } catch (_) {
      emit(AddJobError());
    }
  }
}
