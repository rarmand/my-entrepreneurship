import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';
import 'package:my_entrepreneurship/user_profile/user_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).appTitle)),
      body: const Center(child: UserProfilePage()),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.black12,
        color: Colors.black12,
        animationDuration: const Duration(microseconds: 300),
        items: const <CurvedNavigationBarItem>[
          CurvedNavigationBarItem(
            child: Icon(Icons.home, size: 26, color: Colors.grey),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.business_center, size: 26, color: Colors.grey),
            label: 'Savings',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.payment, size: 26, color: Colors.grey),
            label: 'Budget',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.account_box, size: 26, color: Colors.grey),
            label: 'User',
          ),
        ],
      ),
    );
  } 
}