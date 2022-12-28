part of 'add_company_bloc.dart';

abstract class AddCompanyState extends Equatable {
  const AddCompanyState();

  @override
  List<Object> get props => [];
}

class AddCompanyLoading extends AddCompanyState {}

class AddCompanySuccess extends AddCompanyState {}

class AddCompanyError extends AddCompanyState {}
