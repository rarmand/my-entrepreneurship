import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_form_event.dart';
part 'user_form_state.dart';

// scenario:
// user is onboarded and he has to put some information about himself
// they are mandatory, without them application cannot prepare basic information
// user fills first info to identify him:
// username
// birth year
// income
// currency
// date of expected income to bank account
// free money to invest
// he submits them and creates first basic data for next operations

// user form is empty
// user form is filled in 100%
// user form is validated
// user form is submitted
// validation and filling can be checked when user form is submitted
// if it is not filled and correct, it won't be submitted

// UserFormEvent - input to the UserFormBloc
// processed and used to emit new State instances
//
// react to events:
// UserFormSubmitted
// 
// UserFormState - output of the UserFormBloc 
// consumed by the presentation layer
//
// states:
// empty
// filled
// submitted

// determines user data and first statistical recommendations
class UserFormBloc extends Bloc<UserFormEvent, UserFormState>{
  UserFormBloc(): super(const UserFormState());
  
  void usernameChanged(String value) {
    final String username = (value.isNotEmpty && value.length > 2) ? value : '';

    emit(state.copyWith(
      username: username,
    ));
  }

  void birthYearChanged(String value) {
    final int birthYear = value.isNotEmpty ? int.parse(value) : -1;
    emit(state.copyWith(birthYear: birthYear));
  }

  // required UserRepository userRepository
  //  : _userRepository = userRepository,
  //     super(UserFormState.empty());

  // final UserRepository _userRepository;
}