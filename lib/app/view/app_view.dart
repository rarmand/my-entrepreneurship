import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_entrepreneurship/home/home.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

// TODO: check why i cannot add title with AppLocalizations
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const HomePage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}