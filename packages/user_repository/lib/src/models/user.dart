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
    DateTime? incomeRegistrationDate,
    this.freeAmount,
    this.isNewUser = true,
  }): this.incomeRegistrationDate = incomeRegistrationDate ?? DateTime.now();

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
  final DateTime? incomeRegistrationDate;
  
  /// The current user's free money amount for calculations
  final double? freeAmount;

  /// Whether the current user is a first time user
  final bool isNewUser;

  /// Initial user state which represent user before providing the data
  static User initial = User(id: '');

  @override
  List<Object?> get props => [
    id, 
    username, 
    birthYear, 
    avgMonthlyIncome, 
    incomeCurrency, 
    incomeRegistrationDate, 
    freeAmount, 
    isNewUser,
  ];
}