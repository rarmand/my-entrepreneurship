part of 'user_form_bloc.dart';

sealed class UserFormEvent {
  const UserFormEvent();
}

// my events
// form field changed 
// form submitted
// form cancelled somehow
// e.g. turning off the app

final class UserFormUpdated extends UserFormEvent {
  const UserFormUpdated(this.userData);

  final Map<String, dynamic> userData;

  @override
  List<Object> get props => [userData];
}

final class UserFormSubmitted extends UserFormEvent {}

// TODO: needs specific definition how to handle this process
final class UserFormCancelled extends UserFormEvent {}