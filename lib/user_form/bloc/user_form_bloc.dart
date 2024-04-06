import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'user_form_event.dart';
part 'user_form_state.dart';

// TODO: add documentation

class UserFormBloc extends Bloc<UserFormEvent, UserFormState>{
  UserFormBloc({
    required UserRepository userRepository,
    required User? initialUser,
  }): _userRepository = userRepository, 
      super(UserFormState(
        initialUser: initialUser,
        username: initialUser?.username ?? '',
        birthYear: initialUser?.birthYear ?? 0,
        avgMonthlyIncome: initialUser?.avgMonthlyIncome ?? 0,
        incomeCurrency: initialUser?.incomeCurrency ?? '',
        freeAmount: initialUser?.freeAmount ?? 0,
      )) {
    on<UserFormUsernameChanged>(_onUsernameChanged);
    on<UserFormBirthYearChanged>(_onBirthYearChanged);
    on<UserFormAverageMonthlyIncomeChanged>(_onAverageMonthlyIncomeChanged);
    on<UserFormIncomeCurrencyChanged>(_onIncomeCurrencyChanged);
    on<UserFormFreeAmountChanged>(_onFreeAmountChanged);
    on<UserFormSubmitted>(_onSubmitted);
    on<UserFormCancelled>(_onCancelled);
  }

  final UserRepository _userRepository;
  
  void _onUsernameChanged(UserFormUsernameChanged event, Emitter<UserFormState> emit) {
    emit(state.copyWith(username: event.username, status: UserFormStatus.updated));
  }

  void _onBirthYearChanged(UserFormBirthYearChanged event, Emitter<UserFormState> emit) {
    emit(state.copyWith(birthYear: event.birthYear, status: UserFormStatus.updated));
  }

  void _onAverageMonthlyIncomeChanged(UserFormAverageMonthlyIncomeChanged event, Emitter<UserFormState> emit) {
    emit(state.copyWith(avgMonthlyIncome: event.avgMonthlyIncome, status: UserFormStatus.updated));
  }

  void _onIncomeCurrencyChanged(UserFormIncomeCurrencyChanged event, Emitter<UserFormState> emit) {
    emit(state.copyWith(incomeCurrency: event.incomeCurrency, status: UserFormStatus.updated));
  }

  void _onFreeAmountChanged(UserFormFreeAmountChanged event, Emitter<UserFormState> emit) {
    emit(state.copyWith(freeAmount: event.freeAmount, status: UserFormStatus.updated));
  }

  Future<void> _onSubmitted(UserFormSubmitted event, Emitter<UserFormState> emit) async {
    emit(state.copyWith(status: UserFormStatus.loading));

    print(state);

    // TODO: jak działa to tworzenie nowego uzytkownika?
    // cos nie pasuje z ID
    final user = state.initialUser ?? User(
      username: state.username,
      birthYear: state.birthYear,
      avgMonthlyIncome: state.avgMonthlyIncome,
      incomeCurrency: state.incomeCurrency,
      freeAmount: state.freeAmount,
    );

    try {
      await _userRepository.saveUser(user);
      print('works');
      emit(state.copyWith(status: UserFormStatus.submitted));
    } catch (e) {
      print('doesnt work');
      emit(state.copyWith(status: UserFormStatus.failed));
    }
  }

  void _onCancelled(UserFormCancelled event, Emitter<UserFormState> emit) {
    emit(state.copyWith(status: UserFormStatus.cancelled));
  }
}