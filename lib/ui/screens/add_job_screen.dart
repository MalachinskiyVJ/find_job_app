import 'package:find_job/bloc/add_job_bloc/add_job_bloc.dart';
import 'package:find_job/models/add_job_req_model.dart';
import 'package:find_job/ui/screens/add_job_result_screen.dart';
import 'package:find_job/ui/widgets/custom_button.dart';
import 'package:find_job/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({Key? key}) : super(key: key);

  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _companyIdController = TextEditingController();

  final _titleNode = FocusNode();
  final _descriptionNode = FocusNode();
  final _cityNode = FocusNode();
  final _companyIdNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Job"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              textEditingController: _titleController,
              maxLines: 1,
              maxLength: 20,
              hintText: "Enter job title",
              enabledBorderColor: Colors.orangeAccent,
              focusedBorderColor: Colors.black54,
              keyboardType: TextInputType.text,
              focusNode: _titleNode,
              isAutoFocus: false,
              onSubmited: (_) {
                _descriptionController.text.isEmpty
                    ? _fieldFocusChange(context, _titleNode, _descriptionNode)
                    : null;
              },
            ),
            CustomTextField(
              textEditingController: _descriptionController,
              maxLines: 3,
              maxLength: 30,
              hintText: "Enter job description",
              enabledBorderColor: Colors.orangeAccent,
              focusedBorderColor: Colors.black54,
              keyboardType: TextInputType.text,
              focusNode: _descriptionNode,
              isAutoFocus: false,
              onSubmited: (_) {
                _cityController.text.isEmpty
                    ? _fieldFocusChange(context, _descriptionNode, _cityNode)
                    : null;
              },
            ),
            CustomTextField(
              textEditingController: _cityController,
              maxLines: 1,
              maxLength: 20,
              hintText: "Enter job city",
              enabledBorderColor: Colors.orangeAccent,
              focusedBorderColor: Colors.black54,
              keyboardType: TextInputType.text,
              focusNode: _cityNode,
              isAutoFocus: false,
            ),
            CustomTextField(
              textEditingController: _companyIdController,
              maxLines: 1,
              maxLength: 20,
              hintText: "Enter company id",
              enabledBorderColor: Colors.orangeAccent,
              focusedBorderColor: Colors.black54,
              keyboardType: TextInputType.text,
              filterTextInputFormatter: [
                FilteringTextInputFormatter.digitsOnly
              ],
              focusNode: _companyIdNode,
              isAutoFocus: false,
            ),
            CustomButton(
              onPressed: (() => _onPressed()),
              buttonText: "Додати вакансію",
              color: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _onPressed() {
    if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _cityController.text.isEmpty ||
        _titleController.text.isEmpty) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: const Text('Заповніть всі поля форми'),
                actions: [
                  TextButton(
                      onPressed: (() => Navigator.pop(context, 'Зрозуміло')),
                      child: const Text('Зрозуміло')),
                ],
              ));
    } else {
      context.read<AddJobBloc>().add(AddJob(AddJobRequest(
          title: _titleController.text,
          description: _descriptionController.text,
          city: _cityController.text,
          companyId: int.parse(_companyIdController.text))));
      _titleController.clear();
      _descriptionController.clear();
      _cityController.clear();
      _companyIdController.clear();
      Navigator.of(context).pushNamed(AddJobResultScreen.id);
    }
  }
}
