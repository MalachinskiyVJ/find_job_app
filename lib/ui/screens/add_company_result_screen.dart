import 'package:find_job/bloc/add_company_bloc/add_company_bloc.dart';
import 'package:find_job/ui/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCompanyResultScreen extends StatelessWidget {
  const AddCompanyResultScreen({Key? key}) : super(key: key);

  static const id = 'add_company_result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<AddCompanyBloc, AddCompanyState>(
            builder: (context, state) {
              if (state is AddCompanyLoading) {
                return const CircularProgressIndicator(
                    color: Colors.lightBlueAccent);
              } else if (state is AddCompanySuccess) {
                return Column(
                  children: [
                    Image.asset('assets/done.png'),
                    const Text("Компанія створена успішно",
                        style: TextStyle(fontSize: 20)),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Image.asset('assets/done.png'),
                    const Text("Упс, сталося не як гадалося",
                        style: TextStyle(fontSize: 20)),
                  ],
                );
              }
            },
          ),
          TextButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed(TabsScreen.id),
              child: const Text(
                "Перейти на головний екран",
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    ));
  }
}
