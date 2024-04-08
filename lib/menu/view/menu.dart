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

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: AppLocalizations.of(context).menuBtnHomeLabel,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.business_center),
          label: AppLocalizations.of(context).menuBtnSavingsLabel,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.payment),
          label: AppLocalizations.of(context).menuBtnBudgetLabel,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_box),
          label: AppLocalizations.of(context).menuBtnUserLabel,
        ),
        // BottomNavigationBarItem(
        //   icon: const Icon(Icons.more_vert),
        //   label: AppLocalizations.of(context).menuBtnMoreLabel,
        // ),
      ],
    );
  }
}