part of 'user_form_bloc.dart';

// TODO: add documentation

enum UserFormStatus {
  initial, 
  updated,
  loading,
  submitted,
  failed,
  cancelled
}

final class UserFormState extends Equatable {
  const UserFormState({
    this.status = UserFormStatus.initial,
    this.initialUser,
    this.username = '',
    this.birthYear = 0,
    this.avgMonthlyIncome = 0,
    this.incomeCurrency = '',
    this.freeAmount = 0,
  });

  final UserFormStatus status;

  final User? initialUser;

  final String username;
  final int birthYear;
  final double avgMonthlyIncome;
  final String incomeCurrency;
  final double freeAmount;

  bool get isNewUser => initialUser == null;

  @override
  List<Object?> get props => [
    status,
    initialUser,
    username,
    birthYear,
    avgMonthlyIncome,
    incomeCurrency,
    freeAmount, 
  ];

  UserFormState copyWith({
    UserFormStatus? status,
    User? initialUser,
    String? username,
    int? birthYear,
    double? avgMonthlyIncome,
    String? incomeCurrency,
    double? freeAmount,
  }) {
    return UserFormState(
      status: status ?? this.status,
      initialUser: initialUser ?? this.initialUser,
      username: username ?? this.username,
      birthYear: birthYear ?? this.birthYear,
      avgMonthlyIncome: avgMonthlyIncome ?? this.avgMonthlyIncome,
      incomeCurrency: incomeCurrency ?? this.incomeCurrency,
      freeAmount: freeAmount ?? this.freeAmount,
    );
  }
}