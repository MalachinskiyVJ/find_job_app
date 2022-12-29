part of 'add_job_bloc.dart';

abstract class AddJobEvent extends Equatable {
  const AddJobEvent();

  @override
  List<Object> get props => [];
}

class AddJob extends AddJobEvent {
  const AddJob(this.addJobRequest);
  final AddJobRequest addJobRequest;

  @override
  List<Object> get props => [addJobRequest];
}
