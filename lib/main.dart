import 'package:find_job/bloc/add_company_bloc/add_company_bloc.dart';
import 'package:find_job/bloc/companies_bloc/companies_bloc.dart';
import 'package:find_job/bloc/jobs_bloc/jobs_bloc.dart';
import 'package:find_job/repositories/companies/companies_repository.dart';
import 'package:find_job/repositories/jobs/jobs_repository.dart';
import 'package:find_job/ui/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:find_job/services/app_router.dart';
import 'package:find_job/simple_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
      () => runApp(MyApp(
            appRouter: AppRouter(),
          )),
      blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => CompaniesRepository(),
          ),
          RepositoryProvider(
            create: (context) => JobsRepository(),
          ),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CompaniesBloc(
                    companiesRepository: context.read<CompaniesRepository>())
                  ..add(const LoadCompanies()),
              ),
              BlocProvider(
                create: (context) =>
                    JobsBloc(jobsRepository: context.read<JobsRepository>())
                      ..add(const LoadJobs()),
              ),
              BlocProvider(
                create: (context) => AddCompanyBloc(
                    companiesRepository: context.read<CompaniesRepository>()),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Find job app',
              onGenerateRoute: appRouter.onGenerateRoute,
              theme: ThemeData(),
              home: const TabsScreen(),
            )));
  }
}
