import 'package:find_job/models/add_job_req_model.dart';
import 'package:find_job/models/companies_resp_model.dart';
import 'package:find_job/ui/screens/add_company_result_screen.dart';
import 'package:find_job/ui/screens/add_job_result_screen.dart';
import 'package:find_job/ui/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TabsScreen.id:
        return MaterialPageRoute(builder: (_) => const TabsScreen());
      // case CompanyDetailsScreen.id:
      //  final args = routeSettings.arguments as ScreenArguments;
      // return MaterialPageRoute(
      //     builder: (context) => CompanyDetailsScreen(companyData: args));
      case AddCompanyResultScreen.id:
        return MaterialPageRoute(
            builder: (_) => const AddCompanyResultScreen());
      case AddJobResultScreen.id:
        return MaterialPageRoute(builder: (_) => const AddJobResultScreen());
      default:
        return null;
    }
  }
}
