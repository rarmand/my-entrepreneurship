import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'user_form_event.dart';
part 'user_form_state.dart';

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
  UserFormBloc({
    required UserRepository userRepository
  }) : _userRepository = userRepository,
      super(const UserFormState.empty());

  final UserRepository _userRepository;
}