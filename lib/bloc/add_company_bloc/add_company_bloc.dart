import 'package:equatable/equatable.dart';
import 'package:find_job/models/add_company_req_model.dart';
import 'package:find_job/repositories/companies/companies_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_company_event.dart';
part 'add_company_state.dart';

class AddCompanyBloc extends Bloc<AddCompanyEvent, AddCompanyState> {
  final CompaniesRepository _companiesRepository;

  AddCompanyBloc({required CompaniesRepository companiesRepository})
      : _companiesRepository = companiesRepository,
        super(AddCompanyLoading()) {
    on<AddCompany>(_onAddCompany);
  }

  Future<void> _onAddCompany(
      AddCompany event, Emitter<AddCompanyState> emit) async {
    emit(AddCompanyLoading());
    try {
      await _companiesRepository.addCompany(event.addCompanyRequest);
      emit(AddCompanySuccess());
    } catch (_) {
      emit(AddCompanyError());
    }
  }
}
