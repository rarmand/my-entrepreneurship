import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_entrepreneurship/base/base.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

// TODO: check why i cannot add title with AppLocalizations
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Base(),
    );
  }
}