import 'package:equatable/equatable.dart';

/// {@template user}
/// User model
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  User({
    required this.id,
    this.username,
    this.birthYear,
    this.avgMonthlyIncome,
    this.incomeCurrency,
    DateTime? incomeDate,
    this.freeAmount,
    this.isNewUser = true,
  }): this.incomeDate = incomeDate ?? DateTime.now();

  /// The current user's id
  final String id;

  /// The current user's username (display name)
  final String? username;

  /// The current user's birth year for calculations
  final int? birthYear;

  /// The current user's average monthly income for calculations
  final double? avgMonthlyIncome;

  /// The current user's income currency for calculations
  final String? incomeCurrency;
  
  /// Date of registered income of the current user for calculations
  final DateTime? incomeDate;
  
  /// The current user's free money amount for calculations
  final double? freeAmount;

  /// Whether the current user is a first time user
  final bool isNewUser;

  // static const initial = User(id: '');

  @override
  List<Object?> get props => [
    id, username, birthYear, avgMonthlyIncome, incomeCurrency, incomeDate, freeAmount, isNewUser,
  ];
}