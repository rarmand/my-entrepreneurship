part of 'user_form_bloc.dart';

enum UserFormStatus {
  initial, 
  userUpdated,
}

class UserFormState extends Equatable {
  const UserFormState({
    required this.status,
    required this.user,
  });

  UserFormState.initial()
    : this(
      status: UserFormStatus.initial,
      user: User.initial,
    ); 

  final UserFormStatus status;
  final User user;

  @override
  List<Object?> get props => [status, user];

  UserFormState copyWith({
    UserFormStatus? status,
    User? user,
  }) {
    return UserFormState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }
}