import 'package:find_job/bloc/add_job_bloc/add_job_bloc.dart';
import 'package:find_job/ui/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddJobResultScreen extends StatelessWidget {
  const AddJobResultScreen({Key? key}) : super(key: key);

  static const id = 'add_job_result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<AddJobBloc, AddJobState>(
            builder: (context, state) {
              if (state is AddJobLoading) {
                return const CircularProgressIndicator(
                    color: Colors.lightBlueAccent);
              } else if (state is AddJobSuccess) {
                return Column(
                  children: [
                    Image.asset('assets/done.png'),
                    const Text("Вакансія створена успішно",
                        style: TextStyle(fontSize: 20)),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Image.asset('assets/failed.png'),
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
