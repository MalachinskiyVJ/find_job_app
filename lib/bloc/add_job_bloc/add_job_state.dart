part of 'add_job_bloc.dart';

abstract class AddJobState extends Equatable {
  const AddJobState();

  @override
  List<Object> get props => [];
}

class AddJobLoading extends AddJobState {}

class AddJobSuccess extends AddJobState {}

class AddJobError extends AddJobState {}
