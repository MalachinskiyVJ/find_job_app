import 'package:find_job/bloc/add_company_bloc/add_company_bloc.dart';
import 'package:find_job/models/add_company_req_model.dart';
import 'package:find_job/ui/screens/add_company_result_screen.dart';
import 'package:find_job/ui/widgets/custom_button.dart';
import 'package:find_job/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCompanyScreen extends StatefulWidget {
  const AddCompanyScreen({Key? key}) : super(key: key);

  @override
  State<AddCompanyScreen> createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends State<AddCompanyScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _industryController = TextEditingController();

  final _nameNode = FocusNode();
  final _descriptionNode = FocusNode();
  final _industryNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Company"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              textEditingController: _nameController,
              maxLines: 1,
              maxLength: 20,
              hintText: "Enter company name",
              enabledBorderColor: Colors.lightBlueAccent,
              focusedBorderColor: Colors.black54,
              keyboardType: TextInputType.text,
              focusNode: _nameNode,
              isAutoFocus: false,
              onSubmited: (_) {
                _descriptionController.text.isEmpty
                    ? _fieldFocusChange(context, _nameNode, _descriptionNode)
                    : null;
              },
            ),
            CustomTextField(
              textEditingController: _descriptionController,
              maxLines: 3,
              maxLength: 20,
              hintText: "Enter company description",
              enabledBorderColor: Colors.lightBlueAccent,
              focusedBorderColor: Colors.black54,
              keyboardType: TextInputType.text,
              focusNode: _descriptionNode,
              isAutoFocus: false,
              onSubmited: (_) {
                _industryController.text.isEmpty
                    ? _fieldFocusChange(context, _nameNode, _industryNode)
                    : null;
              },
            ),
            CustomTextField(
              textEditingController: _industryController,
              maxLines: 3,
              maxLength: 20,
              hintText: "Enter company industry",
              enabledBorderColor: Colors.lightBlueAccent,
              focusedBorderColor: Colors.black54,
              keyboardType: TextInputType.text,
              focusNode: _industryNode,
              isAutoFocus: false,
            ),
            CustomButton(
              onPressed: (() => _onPressed()),
              buttonText: "Додати компанію",
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
    if (_nameController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _industryController.text.isEmpty) {
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
      context.read<AddCompanyBloc>().add(AddCompany(AddCompanyRequest(
          name: _nameController.text,
          description: _descriptionController.text,
          industry: _industryController.text)));
      _nameController.clear();
      _descriptionController.clear();
      _industryController.clear();
      Navigator.of(context).pushNamed(AddCompanyResultScreen.id);
    }
  }
}
