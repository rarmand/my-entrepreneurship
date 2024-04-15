import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_entrepreneurship/constants/constants.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';
import 'package:my_entrepreneurship/user_form/bloc/user_form_bloc.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

/*
TODO:
  - po usunięciu forma nie działa walidacja - poprawić to bagno
  - posprawdzać walidację wszystkich pól
  - walidacja dla datetime 
  - plan działania gdy formularz jest włączony do edycji juz istniejącego usera
*/


class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var langTag = Localizations.maybeLocaleOf(context)?.toLanguageTag();
    // final DateFormat formatter = DateFormat.yMMMd(langTag);

    // final status = context.select((UserFormBloc bloc) => bloc.state.status);
    // final isNewUser = context.select((UserFormBloc bloc) => bloc.state.status);

    // TODO: check if new user or else doesnt show cancel button?
    return BlocBuilder<UserFormBloc, UserFormState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                tooltip: AppLocalizations.of(context).userFormActionCancelTooltip,
                onPressed: () {
                  context.read<UserFormBloc>().add(const UserFormCancelled());
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
              title: Text(AppLocalizations.of(context).userFormTitle),
            ),
            extendBody: true,
            body: const SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _UsernameInput(),
                    _BirthYearInput(),
                    _AverageIncomeInput(),
                    _FreeCapitalInput(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20),
              child: _SubmitButton(_formKey),
            ),
          ), 
        );
      }
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({
    this.initialValue
  });
  
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0) , 
      child: TextFormField(
        key: const Key('userForm_username_textFormField'),
        initialValue: initialValue,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context).userFormUsernameValidationLabel;
          }
          return null;
        },
        onChanged: (value) {
          if (value != initialValue) {
            context.read<UserFormBloc>().add(UserFormUsernameChanged(value));
          }
        },
        maxLength: 20,
        maxLines: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: "",
          border: const UnderlineInputBorder(), 
          labelText: AppLocalizations.of(context).userFormUsernameLabel,
          hintText: '',
          hintStyle: const TextStyle(
            height: 2.0,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

class _BirthYearInput extends StatelessWidget {
  const _BirthYearInput({
    this.initialValue,
  });
  
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0) , 
      child: TextFormField(
        key: const Key('userForm_birthYear_textFormField'),
        initialValue: initialValue,
        onChanged: (value) {
          if (value != initialValue) {
            context.read<UserFormBloc>().add(UserFormBirthYearChanged(int.tryParse(value) ?? 0));
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context).userFormBirthYearValidationLabel;
          }

          int birthYear = int.tryParse(value) ?? 0;

          if (birthYear > DateTime.now().year || birthYear < 1900) {
            return AppLocalizations.of(context).userFormBirthYearValidationLabel;
          }

          return null;
        },
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 4,
        maxLines: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: "",
          border: const UnderlineInputBorder(), 
          labelText: AppLocalizations.of(context).userFormBirthYearLabel,
          hintText: '',
          hintStyle: const TextStyle(
            height: 2.0,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

// TODO: jeśli pojawią się rózne waluty, mozna dodać nizej pola przeliczenie względem zarobkowej waluty (cos alla error label)
// pewnie do wyliczenia przy walidacji

class _AverageIncomeInput extends StatelessWidget {
  const _AverageIncomeInput({
    this.initialIncomeValue,
    this.initialCurrencyValue,
  });
  
  final String? initialIncomeValue;
  final String? initialCurrencyValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0) , 
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: TextFormField(
              key: const Key('userForm_averageIncome_textFormField'),
              initialValue: initialIncomeValue,
              onChanged: (value) {
                if (value != initialIncomeValue) {
                  context.read<UserFormBloc>().add(UserFormAverageMonthlyIncomeChanged(double.tryParse(value) ?? 0.0));
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).userFormAverageIncomeValidationLabel;
                }

                final income = double.tryParse(value) ?? 0.0;

                if (income <= 1.0 || income > 500000.0) {
                  return AppLocalizations.of(context).userFormAverageIncomeValidationLabel;
                }

                return null;
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 10,
              maxLines: 1,
              textAlign: TextAlign.center,
              strutStyle: const StrutStyle(
                height: 1.5,
              ),
              decoration: InputDecoration(
                counterText: "",
                border: const UnderlineInputBorder(), 
                labelText: AppLocalizations.of(context).userFormAverageIncomeLabel,
                hintText: '',
                hintStyle: const TextStyle(
                  height: 2.0,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Flexible(
            flex: 1,
            child: _CurrencyDropdownButton(initialValue: initialCurrencyValue),
          ),
        ],
      ),
    );
  }
}

class _FreeCapitalInput extends StatelessWidget {
  const _FreeCapitalInput({
    this.initialCapitalValue,
    this.initialCurrencyValue,
  });
  
  final String? initialCapitalValue;
  final String? initialCurrencyValue;

  @override
  Widget build(BuildContext context) {
    final double avgMonthlyIncome = context.select((UserFormBloc bloc) => bloc.state.avgMonthlyIncome);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), 
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: TextFormField(
              key: const Key('userForm_freeCapital_textFormField'),
              initialValue: initialCapitalValue,
              onChanged: (value) {
                if (value != initialCapitalValue) {
                  context.read<UserFormBloc>().add(UserFormFreeAmountChanged(double.tryParse(value) ?? 0.0));
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context).userFormFreeCapitalValidationLabel;
                }

                final double freeAmount = double.tryParse(value) ?? 0.0;

                if (freeAmount < 1.0) {
                  return AppLocalizations.of(context).userFormFreeCapitalValidationLabel;
                }

                if (avgMonthlyIncome > 0 && freeAmount > avgMonthlyIncome) {
                  return AppLocalizations.of(context).userFormFreeCapitalValidationLabel;
                }

                return null;
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 10,
              maxLines: 1,
              textAlign: TextAlign.center,
              strutStyle: const StrutStyle(
                height: 1.5,
              ),
              decoration: InputDecoration(
                counterText: "",
                border: const UnderlineInputBorder(), 
                labelText: AppLocalizations.of(context).userFormFreeCapitalLabel,
                hintText: '',
                hintStyle: const TextStyle(
                  height: 2.0,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),

          const SizedBox(width: 16.0),

          Flexible(
            flex: 1,
            child: _CurrencyDropdownButton(initialValue: initialCurrencyValue),
          ),
        ],
      ),
    ); 
  }
}

class _CurrencyDropdownButton extends StatelessWidget {
  _CurrencyDropdownButton({
    this.initialValue,
  });
  
  final String? initialValue;
  final List<String> currencyOptions = [
    Currency.pln,
    Currency.eur,
    Currency.chf,
    Currency.usd
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0) , 
      child: DropdownButtonFormField(
        key: const Key('userForm_currency_dropdownBtnFormField'),
        value: initialValue,
        items: currencyOptions.map(
          (curr) => DropdownMenuItem(
            alignment: AlignmentDirectional.center,
            value: curr,
            child: Text(
              curr,
              strutStyle: const StrutStyle(height: 1.5),
            ),
          )).toList(),
        onChanged: (value) {
          context.read<UserFormBloc>().add(UserFormIncomeCurrencyChanged(value!));
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppLocalizations.of(context).userFormCurrencyValidationLabel;
          }
          return null;
        },
        alignment: Alignment.center,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(), 
          labelText: AppLocalizations.of(context).userFormCurrencyLabel,
          hintText: '',
          hintStyle: const TextStyle(
            height: 2.0,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

// TODO: czy na pewno formkey moze byc przesylany do widgetu?
class _SubmitButton extends StatelessWidget {
  const _SubmitButton(this.formKey);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        formKey.currentState?.save();
        if (formKey.currentState!.validate()) {
          context.read<UserFormBloc>().add(const UserFormSubmitted());
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 202, 202, 202),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
      ),
      child: Text(AppLocalizations.of(context).userFormSubmitButton),
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