part of 'user_form_bloc.dart';

class UserFormState extends Equatable {
  const UserFormState({
    this.username = '', 
    this.birthYear = -1,
  });

  final String username;
  final int birthYear;

  @override
  List<Object?> get props => [username, birthYear];

  UserFormState copyWith({
    String? username,
    int? birthYear,
  }) {
    return UserFormState(
      username: username ?? this.username,
      birthYear: birthYear ?? this.birthYear,
    );
  }
}