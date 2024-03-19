part of 'user_form_bloc.dart';

class UserFormState extends Equatable {
  const UserFormState({
    this.username = '', 
    this.birthYear = -1,
    this.errorMessage,
  });

  // UserFormState.empty(): this._();

  // const UserFormState.submitted(User user): this._(user: user);

  // final User user;

  final String? errorMessage;

  // final String id;
  final String username;
  final int birthYear;
  // double avgMonthlyIncome;
  // String incomeCurrency;
  // int incomeDate;
  // double freeAmount;

  // final Map<String, dynamic> myUser = {
  //   id: '-',
  //   username: '',
  //   birthYear: -1,
  //   avgMonthlyIncome: -0.99,
  //   incomeCurrency: '',
  //   incomeDate: DateTime(1999, 1,1),
  //   freeAmount: -0.99,
  // };

  @override
  List<Object?> get props => [username, birthYear, errorMessage];

  UserFormState copyWith({
    String? username,
    int? birthYear,
    String? errorMessage,
  }) {
    return UserFormState(
      username: username ?? this.username,
      birthYear: birthYear ?? this.birthYear,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}