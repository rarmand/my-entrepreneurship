import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

/// {@template user}
/// User model
/// 
/// Contains a, [id], [username], [birthYear], 
/// [avgMonthlyIncome], [incomeCurrency], [freeAmount] fields.
/// 
/// If an [id] is provided, it cannot be empty. If no [id] is provided, one
/// will be generated.
/// 
/// {@endtemplate}
class User extends Equatable {
  /// {@macro user}
  User({
    String? id,
    this.username,
    this.birthYear,
    this.avgMonthlyIncome,
    this.incomeCurrency,
    DateTime? incomeRegistrationDate,
    this.freeAmount,
  }): assert(
        id == null || id.isNotEmpty,
        'id must either be null or not empty',
      ),
      id = id ?? const Uuid().v4(),
      incomeRegistrationDate = incomeRegistrationDate ?? DateTime.now();

  /// The identifier of the `user`
  /// 
  /// Cannot be empty
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

  @override
  List<Object?> get props => [
    id, 
    username, 
    birthYear, 
    avgMonthlyIncome, 
    incomeCurrency, 
    incomeRegistrationDate, 
    freeAmount, 
  ];
}