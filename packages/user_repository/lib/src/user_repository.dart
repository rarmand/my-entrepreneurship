import 'dart:async';

import 'package:user_repository/src/models/models.dart';

class UserRepository {
  User? _user;

  Future<void> saveUser(User user) async {
    if (_user == null) {
      return Future.delayed(
        const Duration(milliseconds: 300),
        () {
          // TODO: create przesłany user
        }
      );
    } else {
      // TODO: update juz istniejącego usera z przesłanymi danymi
    }
  }

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(),
    );
  }
}