part of 'companies_bloc.dart';

abstract class CompaniesEvent extends Equatable {
  const CompaniesEvent();

  @override
  List<Object> get props => [];
}

class LoadCompanies extends CompaniesEvent {
  const LoadCompanies();

  @override
  List<Object> get props => [];
}
