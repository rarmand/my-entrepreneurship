import 'package:equatable/equatable.dart';

class User extends Equatable {
  User(this.id, {
    this.username = '',
    this.birthYear = -1,
    this.avgMonthlyIncome = -0.1,
    this.incomeCurrency = '',
    DateTime? incomeDate,
    this.freeAmount = -1.0,
  }): this.incomeDate = incomeDate ?? DateTime.now();

  final String id;
  final String username;
  final int birthYear;
  final double avgMonthlyIncome;
  final String incomeCurrency;
  final DateTime incomeDate;
  final double freeAmount;

  @override
  List<Object> get props => [
    id, username, birthYear, avgMonthlyIncome, incomeCurrency, incomeDate, freeAmount
  ];

  static User empty = User('-');
}