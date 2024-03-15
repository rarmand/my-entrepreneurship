import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_entrepreneurship/user_form/bloc/user_form_event.dart';
import 'package:my_entrepreneurship/user_form/bloc/user_form_state.dart';

class UserFormBloc extends Bloc<UserFormEvent, UserFormState>{
  UserFormBloc(): super(UserFormState()){
    // on<UserFormEvent>((event, emit)) {
    //   emit(UserFormState());
    // }
  }
}