import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';
import 'package:my_entrepreneurship/user_form/bloc/user_form_bloc.dart';
import 'package:my_entrepreneurship/user_form/widgets/widgets.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    // final formBloc = BlocProvider.of<UserFormBloc>(context);

    return Scaffold(
      body: BlocBuilder<UserFormBloc, UserFormState>(
        builder: (context, state) {
          return PageView(
            // onPageChanged: () {},
            children: [
              Container(
                // page 1
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomFormField(
                      labelText: AppLocalizations.of(context).userFormUsernameLabel,
                      onChanged: (value) {
                        context.read<UserFormBloc>().usernameChanged(value!);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context).userFormUsernameValidationLabel;
                        }
                        return null;
                      },
                    ),

                    CustomFormField(
                      labelText: AppLocalizations.of(context).userFormBirthdayYearLabel,
                      onChanged: (value) {
                        context.read<UserFormBloc>().birthYearChanged(value!);
                      },
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
                        
                          print('field ${state.username} ${state.birthYear}');

                          // TODO: add event
      
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(AppLocalizations.of(context).userFormProcessingInfo)
                            )
                          );
                        }
                      ),
                    ),

                  ],
                ),
              ),
            ],  
          );
        },
      )
    );
  }
}

      
          // Container(
          //   // page 2
          //   color: Colors.green,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       CustomFormField(
          //         labelText: AppLocalizations.of(context).userFormAvgMonthlyIncomeLabel,
          //         validator: (value) {
          //           if (value == null || value.isEmpty) {
          //             return AppLocalizations.of(context).userFormAvgMonthlyIncomeValidationLabel;
          //           }
          //           return null;
          //         },
          //       ),

          //       CustomFormField(
          //         labelText: AppLocalizations.of(context).userFormIncomeCurrencyLabel,
          //         validator: (value) {
          //           if (value == null || value.isEmpty) {
          //             return AppLocalizations.of(context).userFormIncomeCurrencyValidationLabel;
          //           }
          //           return null;
          //         },
          //       ),

          //       CustomFormField(
          //         labelText: AppLocalizations.of(context).userFormIncomeDateLabel,
          //         validator: (value) {
          //           if (value == null || value.isEmpty) {
          //             return AppLocalizations.of(context).userFormIncomeDateValidationLabel;
          //           }
          //           return null;
          //         },
          //       ),

          //       CustomFormField(
          //         labelText: AppLocalizations.of(context).userFormFreeAmountLabel,
          //         validator: (value) {
          //           if (value == null || value.isEmpty) {
          //             return AppLocalizations.of(context).userFormFreeAmountValidationLabel;
          //           }
          //           return null;
          //         },
          //       ),

          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8), 
          //         child: ElevatedButton(
          //           child: Text(AppLocalizations.of(context).userFormSubmitButton),
          //           onPressed: () {
          //             if (_formKey.currentState!.validate()) {
          //               ScaffoldMessenger.of(context).showSnackBar(
          //                 SnackBar(
          //                   content: Text(AppLocalizations.of(context).userFormProcessingInfo)
          //                 )
          //               );
          //             }
          //           },
          //         )
          //       ),
          //     ],
          //   ),
          // ),