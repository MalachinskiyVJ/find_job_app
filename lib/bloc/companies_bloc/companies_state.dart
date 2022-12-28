part of 'companies_bloc.dart';

abstract class CompaniesState extends Equatable {
  const CompaniesState();

  @override
  List<Object> get props => [];
}

class CompaniesLoading extends CompaniesState {}

class CompaniesLoaded extends CompaniesState {
  final List<Company> companies;

  const CompaniesLoaded({required this.companies});

  @override
  List<Object> get props => [companies];
}

class CompaniesError extends CompaniesState {}
