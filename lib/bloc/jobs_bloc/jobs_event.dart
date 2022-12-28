part of 'jobs_bloc.dart';

abstract class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

class LoadJobs extends JobsEvent {
  const LoadJobs();

  @override
  List<Object> get props => [];
}

class LoadJobsByCompany extends JobsEvent {
  final int companyId;

  const LoadJobsByCompany(this.companyId);

  @override
  List<Object> get props => [];
}
