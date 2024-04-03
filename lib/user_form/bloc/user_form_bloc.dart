import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'user_form_event.dart';
part 'user_form_state.dart';

// TODO: add documentation

// TODO: determine the flow of creating user profile!!!

// TODO: determine when and how to create a user id 
// before user form or with user form

class UserFormBloc extends Bloc<UserFormEvent, UserFormState>{
  UserFormBloc({
    required UserRepository userRepository,
  }): _userRepository = userRepository, 
      super(const UserFormState.initial()) {
    on<UserFormUsernameChanged>(_onUserFormUsernameChanged);
    on<UserFormBirthYearChanged>(_onUserFormBirthYearChanged);
    on<UserFormAverageMonthlyIncomeChanged>(_onUserFormAverageMonthlyIncomeChanged);
    on<UserFormIncomeCurrencyChanged>(_onUserFormIncomeCurrencyChanged);
    on<UserFormFreeAmountChanged>(_onUserFormFreeAmountChanged);
    on<UserFormSubmitted>(_onSubmitted);
    on<UserFormCancelled>(_onCancelled);
  }

  final UserRepository _userRepository;
  
  void _onUserFormUsernameChanged(UserFormUsernameChanged event, Emitter<UserFormState> emit) {
    emit(state.copyWith(username: event.username, status: UserFormStatus.updated));
  }

  void _onUserFormBirthYearChanged(UserFormBirthYearChanged event, Emitter<UserFormState> emit) {
    emit(state.copyWith(birthYear: event.birthYear, status: UserFormStatus.updated));
  }

  void _onUserFormAverageMonthlyIncomeChanged(UserFormAverageMonthlyIncomeChanged event, Emitter<UserFormState> emit) {
    emit(state.copyWith(avgMonthlyIncome: event.avgMonthlyIncome, status: UserFormStatus.updated));
  }

  void _onUserFormIncomeCurrencyChanged(UserFormIncomeCurrencyChanged event, Emitter<UserFormState> emit) {
    emit(state.copyWith(incomeCurrency: event.incomeCurrency, status: UserFormStatus.updated));
  }

  void _onUserFormFreeAmountChanged(UserFormFreeAmountChanged event, Emitter<UserFormState> emit) {
    emit(state.copyWith(freeAmount: event.freeAmount, status: UserFormStatus.updated));
  }

  void _onSubmitted(UserFormSubmitted event, Emitter<UserFormState> emit) {}

  void _onCancelled(UserFormCancelled event, Emitter<UserFormState> emit) {}
}