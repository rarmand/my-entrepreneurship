import 'package:flutter/material.dart';

import 'user_profile.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: UserProfile()),
    );
  } 
}