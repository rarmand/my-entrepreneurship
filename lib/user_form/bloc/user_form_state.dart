part of 'user_form_bloc.dart';

// TODO: add documentation
// TODO: wonder deeper the flow of creation and futher work with user form state

enum UserFormStatus {
  initial, 
  updated,
  submitted,
  cancelled
}

final class UserFormState extends Equatable {
  const UserFormState({
    required this.status,
    required this.username,
    required this.birthYear,
    required this.avgMonthlyIncome,
    required this.incomeCurrency,
    required this.freeAmount,
  });

  const UserFormState.initial()
    : this(
      status: UserFormStatus.initial,
      username: '',
      birthYear: 0,
      avgMonthlyIncome: 0,
      incomeCurrency: '',
      freeAmount: 0,
    ); 

  final UserFormStatus status;
  final String username;
  final int birthYear;
  final double avgMonthlyIncome;
  final String incomeCurrency;
  final double freeAmount;

  @override
  List<Object?> get props => [
    status,
    username,
    birthYear,
    avgMonthlyIncome,
    incomeCurrency,
    freeAmount, 
  ];

  UserFormState copyWith({
    UserFormStatus? status,
    String? username,
    int? birthYear,
    double? avgMonthlyIncome,
    String? incomeCurrency,
    double? freeAmount,
  }) {
    return UserFormState(
      status: status ?? this.status,
      username: username ?? this.username,
      birthYear: birthYear ?? this.birthYear,
      avgMonthlyIncome: avgMonthlyIncome ?? this.avgMonthlyIncome,
      incomeCurrency: incomeCurrency ?? this.incomeCurrency,
      freeAmount: freeAmount ?? this.freeAmount,
    );
  }
}