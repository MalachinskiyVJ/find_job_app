part of 'add_company_bloc.dart';

abstract class AddCompanyEvent extends Equatable {
  const AddCompanyEvent();

  @override
  List<Object> get props => [];
}

class AddCompany extends AddCompanyEvent {
  const AddCompany(this.addCompanyRequest);
  final AddCompanyRequest addCompanyRequest;

  @override
  List<Object> get props => [addCompanyRequest];
}
