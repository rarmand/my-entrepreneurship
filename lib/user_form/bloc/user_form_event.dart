part of 'user_form_bloc.dart';

// TODO: add documentation

sealed class UserFormEvent extends Equatable {
  const UserFormEvent();

  @override
  List<Object> get props => [];
}

final class UserFormUsernameChanged extends UserFormEvent {
  const UserFormUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class UserFormBirthYearChanged extends UserFormEvent {
  const UserFormBirthYearChanged(this.birthYear);

  final int birthYear;

  @override
  List<Object> get props => [birthYear];
}

final class UserFormAverageMonthlyIncomeChanged extends UserFormEvent {
  const UserFormAverageMonthlyIncomeChanged(this.avgMonthlyIncome);

  final double avgMonthlyIncome;

  @override
  List<Object> get props => [avgMonthlyIncome];
}

final class UserFormIncomeCurrencyChanged extends UserFormEvent {
  const UserFormIncomeCurrencyChanged(this.incomeCurrency);

  final String incomeCurrency;

  @override
  List<Object> get props => [incomeCurrency];
}

final class UserFormFreeAmountChanged extends UserFormEvent {
  const UserFormFreeAmountChanged(this.freeAmount);

  final double freeAmount;

  @override
  List<Object> get props => [freeAmount];
}

// TODO: needs specific definition how to handle this process
final class UserFormSubmitted extends UserFormEvent {
  const UserFormSubmitted();
}

// TODO: needs specific definition how to handle this process
final class UserFormCancelled extends UserFormEvent {
  const UserFormCancelled();
}