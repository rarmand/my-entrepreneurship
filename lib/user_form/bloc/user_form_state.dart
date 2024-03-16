part of 'user_form_bloc.dart';

class UserFormState extends Equatable {
  const UserFormState._({this.user = User.empty});

  const UserFormState.empty(): this._();

  const UserFormState.submitted(User user): this._(user: user);

  final User user;

  @override
  List<Object> get props => [user];
}