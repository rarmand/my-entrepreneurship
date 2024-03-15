import 'package:flutter/material.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';
import 'package:my_entrepreneurship/user_form/widgets/widgets.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  Widget createInputField(TextEditingController controller, String labelText) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8), 
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(), 
            labelText: labelText,
          ),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Scaffold(
        body: PageView(
          children: [
            Container(
              // page 1
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomFormField(
                    labelText: AppLocalizations.of(context).userFormUsernameLabel,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).userFormUsernameValidationLabel;
                      }
                      return null;
                    },
                  ),

                  CustomFormField(
                    labelText: AppLocalizations.of(context).userFormBirthdayYearLabel,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).userFormBirthdayYearValidationLabel;
                      }
                      return null;
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8), 
                    child: ElevatedButton(
                      child: Text(AppLocalizations.of(context).userFormSubmitButton),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(AppLocalizations.of(context).userFormProcessingInfo)
                            )
                          );
                        }
                      },
                    )
                  ),
                ],
              ),
            ),
            Container(
              // page 2
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomFormField(
                    labelText: AppLocalizations.of(context).userFormAvgMonthlyIncomeLabel,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).userFormAvgMonthlyIncomeValidationLabel;
                      }
                      return null;
                    },
                  ),

                  CustomFormField(
                    labelText: AppLocalizations.of(context).userFormIncomeCurrencyLabel,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).userFormIncomeCurrencyValidationLabel;
                      }
                      return null;
                    },
                  ),

                  CustomFormField(
                    labelText: AppLocalizations.of(context).userFormIncomeDateLabel,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).userFormIncomeDateValidationLabel;
                      }
                      return null;
                    },
                  ),

                  CustomFormField(
                    labelText: AppLocalizations.of(context).userFormFreeAmountLabel,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context).userFormFreeAmountValidationLabel;
                      }
                      return null;
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8), 
                    child: ElevatedButton(
                      child: Text(AppLocalizations.of(context).userFormSubmitButton),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(AppLocalizations.of(context).userFormProcessingInfo)
                            )
                          );
                        }
                      },
                    )
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}