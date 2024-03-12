import 'package:flutter/material.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';

class UserForm extends StatelessWidget {
  const UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8), 
          child: TextField(
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
          child: ButtonBar(
            buttonPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4), 
            children: [
              Text(AppLocalizations.of(context).userFormAcceptButton),
            ],
          ),
        ),
      ],
    );
  }
}

mixin userFormUsernameLabel {
}