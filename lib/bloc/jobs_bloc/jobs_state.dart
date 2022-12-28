part of 'jobs_bloc.dart';

abstract class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object> get props => [];
}

class JobsLoading extends JobsState {}

class JobsLoaded extends JobsState {
  final List<Job> jobs;

  const JobsLoaded({required this.jobs});

  @override
  List<Object> get props => [jobs];
}

class CompaniesError extends JobsState {}
