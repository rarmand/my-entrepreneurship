part of 'user_form_bloc.dart';

sealed class UserFormEvent {
  const UserFormEvent();

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

  final String birthYear;

  @override
  List<Object> get props => [birthYear];
}

final class UserFormSubmitted extends UserFormEvent {
  const UserFormSubmitted();
}