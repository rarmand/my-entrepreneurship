import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserFormBloc, UserFormState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Scaffold(
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                pageSnapping: false,
                controller: _pageController,
                children: [
                  // page 1
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomTextFormField(
                          labelText: AppLocalizations.of(context).userFormUsernameLabel,
                          onChanged: (value) {
                            /*
                  context.read<T>() looks up the closest ancestor instance of type T 
                  and is functionally equivalent to BlocProvider.of<T>(context). 
                  
                  context.read is most commonly used for retrieving a bloc instance 
                  in order to add an event within onPressed callbacks.
                            */
                            context.read<UserFormBloc>().add(UserFormUsernameChanged(value!));
                          },
                          validator: (value) {
                            // TODO: check if user exists in DB
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context).userFormUsernameValidationLabel;
                            }
                            return null;
                          },
                        ),

                        CustomTextFormField(
                          labelText: AppLocalizations.of(context).userFormBirthdayYearLabel,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          maxLength: 4,
                          onChanged: (value) {
                            context.read<UserFormBloc>().add(UserFormBirthYearChanged(value!));
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context).userFormBirthdayYearValidationLabel;
                            }

                            int birthYear = int.parse(value);

                            if (birthYear > DateTime.now().year || birthYear < 1900) {
                              return AppLocalizations.of(context).userFormBirthdayYearValidationLabel;
                            }

                            return null;
                          },
                        ),

                      ],
                    ),
                  ),
    
                  // page 2
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        // TODO: validation
                        CustomTextFormField(
                          labelText: AppLocalizations.of(context).userFormAvgMonthlyIncomeLabel,
                          onChanged: (value) {
                            // context.read<UserFormBloc>().add(UserFormUsernameChanged(value!));
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context).userFormAvgMonthlyIncomeValidationLabel;
                            }
                            return null;
                          },
                        ),

                        // TODO: choose button
                        CustomTextFormField(
                          labelText: AppLocalizations.of(context).userFormIncomeCurrencyLabel,
                          onChanged: (value) {
                            // context.read<UserFormBloc>().add(UserFormUsernameChanged(value!));
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context).userFormIncomeCurrencyValidationLabel;
                            }
                            return null;
                          },
                        ),

                        // TODO: validation
                        CustomTextFormField(
                          labelText: AppLocalizations.of(context).userFormIncomeDateLabel,
                          onChanged: (value) {
                            // context.read<UserFormBloc>().add(UserFormUsernameChanged(value!));
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context).userFormIncomeDateValidationLabel;
                            }
                            return null;
                          },
                        ),

                        // TODO: validation
                        CustomTextFormField(
                          labelText: AppLocalizations.of(context).userFormFreeAmountLabel,
                          onChanged: (value) {
                            // context.read<UserFormBloc>().add(UserFormUsernameChanged(value!));
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context).userFormFreeAmountValidationLabel;
                            }
                            return null;
                          },
                        ),

                      ],
                    ),
                  ), 
                
                ],  
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 64), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      child: ElevatedButton(
                        child: const Text("Cofnij"),
                        onPressed: () {
                          _previousPage();
                        
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      child: ElevatedButton(
                        child: Text(AppLocalizations.of(context).userFormSubmitButton),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<UserFormBloc>().add(const UserFormSubmitted());
                            _nextPage();
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     content: Text(AppLocalizations.of(context).userFormProcessingInfo)
                            //   )
                            // );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          );
        },
      )
    );
  }

  void _nextPage() {
    _pageController.animateToPage(
      _pageController.page!.toInt() + 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn
    );
  }

  void _previousPage(){
    _pageController.animateToPage(
      _pageController.page!.toInt() - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn
    );
  }
}