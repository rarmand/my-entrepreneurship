import 'package:flutter/material.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required this.selectedIndex, 
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueSetter<int> onDestinationSelected; 

  @override
  Widget build(BuildContext context) {

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      
      destinations: <NavigationDestination>[
        NavigationDestination(
          icon: const Icon(Icons.home),
          label: AppLocalizations.of(context).menuBtnHomeLabel,
        ),
        NavigationDestination(
          icon: const Icon(Icons.business_center),
          label: AppLocalizations.of(context).menuBtnSavingsLabel,
        ),
        NavigationDestination(
          icon: const Icon(Icons.payment),
          label: AppLocalizations.of(context).menuBtnBudgetLabel,
        ),
        NavigationDestination(
          icon: const Icon(Icons.account_box),
          label: AppLocalizations.of(context).menuBtnUserLabel,
        ),
        // NavigationDestination(
        //   icon: const Icon(Icons.more_vert),
        //   label: AppLocalizations.of(context).menuBtnMoreLabel,
        // ),
      ],
    );
  }
}