import 'package:find_job/models/jobs_resp_model.dart';
import 'package:flutter/material.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({Key? key, required this.jobData}) : super(key: key);

  final Job jobData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(jobData.title ?? ""),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orangeAccent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "title",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      jobData.title ?? "",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    const Text("description",
                        style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 5),
                    Text(
                      jobData.description ?? "",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 15),
                    const Text("city", style: TextStyle(color: Colors.black54)),
                    const SizedBox(height: 5),
                    Text(
                      jobData.city ?? "",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
