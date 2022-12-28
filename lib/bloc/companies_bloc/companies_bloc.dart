import 'package:equatable/equatable.dart';
import 'package:find_job/models/companies_resp_model.dart';
import 'package:find_job/repositories/companies/companies_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'companies_event.dart';
part 'companies_state.dart';

class CompaniesBloc extends Bloc<CompaniesEvent, CompaniesState> {
  final CompaniesRepository _companiesRepository;

  CompaniesBloc({required CompaniesRepository companiesRepository})
      : _companiesRepository = companiesRepository,
        super(CompaniesLoading()) {
    on<LoadCompanies>(_onLoadCompanies);
  }

  Future<void> _onLoadCompanies(
      CompaniesEvent event, Emitter<CompaniesState> emit) async {
    emit(CompaniesLoading());
    try {
      final List<Company>? companies =
          await _companiesRepository.getAllCompanies();
      emit(CompaniesLoaded(companies: companies ?? []));
    } catch (_) {
      emit(CompaniesError());
    }
  }
}
