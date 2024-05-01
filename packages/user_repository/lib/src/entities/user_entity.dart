import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String username;
  final int birthYear;
  final double avgMonthlyIncome;
  final String currency;
  // final DateTime? incomeRegistrationDate;
  final double freeCapital;

  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.birthYear,
    required this.avgMonthlyIncome,
    required this.currency,
    // DateTime? incomeRegistrationDate,
    required this.freeCapital,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'birthYear': birthYear,
      'avgMonthlyIncome': avgMonthlyIncome,
      'currency': currency,
      'freeCapital': freeCapital,
    };
  }

  static UserEntity fromDocument(Map<String, dynamic> doc) {
    return UserEntity(
      id: doc['id'],
      email: doc['email'], 
      username: doc['username'], 
      birthYear: doc['birthYear'], 
      avgMonthlyIncome: doc['avgMonthlyIncome'], 
      currency: doc['currency'], 
      freeCapital: doc['freeCapital'],
    );
  }

  @override
  List<Object?> get props => [
    id,
    email,
    username,
    birthYear,
    avgMonthlyIncome,
    currency,
    freeCapital,
  ];
}