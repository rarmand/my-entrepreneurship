import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.currentIndex, 
    required this.onTap,
  });

  final int currentIndex;
  final ValueSetter<int> onTap; 

  @override
  Widget build(BuildContext context) {

    return CurvedNavigationBar(
      index: currentIndex,
      onTap: onTap,
      items: <CurvedNavigationBarItem>[
        CurvedNavigationBarItem(
          child: const Icon(Icons.home, size: 26, color: Colors.grey),
          label: AppLocalizations.of(context).menuBtnHomeLabel,
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.business_center, size: 26, color: Colors.grey),
          label: AppLocalizations.of(context).menuBtnSavingsLabel,
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.payment, size: 26, color: Colors.grey),
          label: AppLocalizations.of(context).menuBtnBudgetLabel,
        ),
        CurvedNavigationBarItem(
          child: const Icon(Icons.account_box, size: 26, color: Colors.grey),
          label: AppLocalizations.of(context).menuBtnUserLabel,
        ),
      ],
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Colors.black12,
      color: Colors.black12,
      animationDuration: const Duration(microseconds: 300),
    );
  }
}