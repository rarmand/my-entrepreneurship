import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';
import 'package:my_entrepreneurship/user_form/bloc/user_form_bloc.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

/*
  - posprawdzać walidację wszystkich pól
  - posprawdzać typy
  - określić wygląd formularza czy na pewno tak to ma wyglądać
  - uprościć pliki 
  - przekombinowanie formularza
  - nie działa int.parse dla birthYear
  - walidacja dla datetime 
  - zaplanować tworzenie profilu uzytkownika
  - potrzebna restrukturyzacja projektu bo zaczynam sie gubic
*/


class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _pageController = PageController();  

  @override
  Widget build(BuildContext context) {
    // var langTag = Localizations.maybeLocaleOf(context)?.toLanguageTag();
    // final DateFormat formatter = DateFormat.yMMMd(langTag);

    // final status = context.select((UserFormBloc bloc) => bloc.state.status);
    // final isNewUser = context.select((UserFormBloc bloc) => bloc.state.status);


    return BlocBuilder<UserFormBloc, UserFormState>(
      builder: (context, state) {
        return Scaffold(
          body: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Scaffold(
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              pageSnapping: false,
              controller: _pageController,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const _UsernameInput(),
                      const _BirthYearInput(),
                      const _AverageMonthlyIncome(),
                      _IncomeCurrency(),
                      const _FreeMoneyAmount(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
        );
      });
  }
}

                 
            // bottomNavigationBar: Padding(
            //   padding: const EdgeInsets.fromLTRB(16, 16, 16, 64), 
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       // if (_pageController.page != 0)
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            //         child: ElevatedButton(
            //           child: const Text("Cofnij"),
            //           onPressed: () {
            //             _previousPage();
                      
            //           },
            //         ),
            //       ),

            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            //         child: ElevatedButton(
            //           child: Text(AppLocalizations.of(context).userFormSubmitButton),
            //           onPressed: () {
            //             // _formKey.currentState!.save();
                        
                        // print("Test `${_formKey.currentState?.value}");
                          
                        // // TODO: how to validate it in other way?
                        // if (_formKey.currentState!.validate()) {
                        //   final formData = _formKey.currentState?.instantValue;
                          
                        //   print('Form data ${formData!}');
                        //   print('Test type ${_formKey.currentState?.instantValue['birthYear'].runtimeType}');
                        //   print('Test type ${_formKey.currentState?.instantValue['freeAmount'].runtimeType}');
                        //   print('Test type ${_formKey.currentState?.instantValue['incomeRegistrationDate'].runtimeType}');

                          
                          // ${userData['birthYear'].runtimeType}
                          // context.read<UserFormBloc>().add(UserFormSubmitted());
                          // context.read<UserFormBloc>().add(UserFormUpdated(formData));
                        // }

            //             // _nextPage();
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

//   void _nextPage() {
//     _pageController.animateToPage(
//       _pageController.page!.toInt() + 1,
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.easeIn
//     );
//   }

//   void _previousPage(){
//     _pageController.animateToPage(
//       _pageController.page!.toInt() - 1,
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.easeIn
//     );
//   }
// }

class _UsernameInput extends StatelessWidget {
  const _UsernameInput();
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('userForm_username_textFormField'),
      initialValue: '',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context).userFormUsernameValidationLabel;
        }
        return null;
      },
      onChanged: (value) {
        context.read<UserFormBloc>().add(UserFormUsernameChanged(value));
      },
      maxLength: 20,
      maxLines: 1,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: const OutlineInputBorder(), 
        labelText: AppLocalizations.of(context).userFormUsernameLabel,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class _BirthYearInput extends StatelessWidget {
  const _BirthYearInput();
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('userForm_birthYear_textFormField'),
      initialValue: '',
      onChanged: (value) {
        context.read<UserFormBloc>().add(UserFormBirthYearChanged(int.tryParse(value) ?? 0));
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context).userFormBirthdayYearValidationLabel;
        }

        int birthYear = int.tryParse(value) ?? 0;

        if (birthYear > DateTime.now().year || birthYear < 1900) {
          return AppLocalizations.of(context).userFormBirthdayYearValidationLabel;
        }

        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 4,
      maxLines: 1,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: const OutlineInputBorder(), 
        labelText: AppLocalizations.of(context).userFormBirthdayYearLabel,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class _AverageMonthlyIncome extends StatelessWidget {
  const _AverageMonthlyIncome();
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('userForm_avgMonthlyIncome_textFormField'),
      initialValue: '',
      onChanged: (value) {
        context.read<UserFormBloc>().add(UserFormAverageMonthlyIncomeChanged(double.tryParse(value) ?? 0.0));
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context).userFormAvgMonthlyIncomeValidationLabel;
        }

        final income = double.tryParse(value) ?? 0.0;

        if (income <= 1.0 || income > 500000.0) {
          return AppLocalizations.of(context).userFormAvgMonthlyIncomeValidationLabel;
        }

        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 10,
      maxLines: 1,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: const OutlineInputBorder(), 
        labelText: AppLocalizations.of(context).userFormAvgMonthlyIncomeLabel,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class _IncomeCurrency extends StatelessWidget {
  _IncomeCurrency();
  
  final List<String> currencyOptions = ['PLN', 'USD', 'EUR'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      key: const Key('userForm_incomeCurrency_dropdowntextFormField'),
      value: currencyOptions[0],
      items: currencyOptions.map(
        (curr) => DropdownMenuItem(
          alignment: AlignmentDirectional.center,
          value: curr,
          child: Text(curr),
        )).toList(),
      onChanged: (value) {
        context.read<UserFormBloc>().add(UserFormIncomeCurrencyChanged(value!));
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context).userFormIncomeCurrencyValidationLabel;
        }
        return null;
      },
      alignment: Alignment.center,
      decoration: InputDecoration(
        border: const OutlineInputBorder(), 
        labelText: AppLocalizations.of(context).userFormIncomeCurrencyLabel,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

class _FreeMoneyAmount extends StatelessWidget {
  const _FreeMoneyAmount();
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('userForm_freeMoneyAmount_textFormField'),
      initialValue: '',
      onChanged: (value) {
        context.read<UserFormBloc>().add(UserFormFreeAmountChanged(double.tryParse(value) ?? 0.0));
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context).userFormFreeAmountValidationLabel;
        }

        final double freeAmount = double.tryParse(value) ?? 0.0;

        if (freeAmount < 1.0) {
          return AppLocalizations.of(context).userFormFreeAmountValidationLabel;
        }
        // var income = _formKey.currentState?.value['avgMonthlyIncome'] ?? 0.0;                            

        // if (income > 0 && freeAmount > income) {
        //   return AppLocalizations.of(context).userFormFreeAmountValidationLabel;
        // }

        return null;
      },
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 10,
      maxLines: 1,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: const OutlineInputBorder(), 
        labelText: AppLocalizations.of(context).userFormFreeAmountLabel,
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}

// TODO: validation
// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
//   child: FormBuilderDateTimePicker(
//     name: 'incomeRegistrationDate',
//     initialDate: DateTime.now(),
//     format: formatter,
//     // validator: (value) => {
//     //   if (value! > DateTime.now()) {
//     //     return AppLocalizations.of(context).userFormIncomeDateValidationLabel;
//     //   }
//     //   return null;
//     // },
//     inputType: InputType.date,
//     decoration: InputDecoration(
//       labelText:  AppLocalizations.of(context).userFormIncomeDateLabel,
//     ),
//   ),
// ),