import 'package:flutter/material.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formController = TextEditingController();
   
  @override
  void dispose() {
    formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8), 
          child: TextField(
            controller: formController,
            decoration: InputDecoration(
              border: OutlineInputBorder(), 
              labelText: AppLocalizations.of(context).userFormUsernameLabel,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8), 
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(), 
              labelText: AppLocalizations.of(context).userFormBirthdayYearLabel,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8), 
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(), 
              labelText: AppLocalizations.of(context).userFormAvgMonthlyIncomeLabel,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8), 
          child: FloatingActionButton(
            child: const Icon(Icons.text_fields),
            tooltip: 'Show text',
            onPressed: () {
              showDialog(
              context: context, 
              builder: (context) {
                return AlertDialog(
                  content: Text(formController.text),
                );
              });
            }
          ),
        ),
      ],
    );
  }
}