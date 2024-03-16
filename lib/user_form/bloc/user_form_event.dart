part of 'user_form_bloc.dart';

sealed class UserFormEvent {
  const UserFormEvent();
}

final class UserFormSubmitted extends UserFormEvent {}