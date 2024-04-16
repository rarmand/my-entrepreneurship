import 'package:flutter/material.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';
import 'package:my_entrepreneurship/theme/theme.dart';
import 'package:my_entrepreneurship/user_form/user_form.dart';
import 'package:provider/provider.dart';


class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isViewDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).userProfileTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: Icon(isViewDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: AppLocalizations.of(context).userProfileActionChangeModeTooltip,
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            }, 
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: AppLocalizations.of(context).userProfileActionEditProfileTooltip,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserForm()),
              );
            }, 
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.orange,
                ),
                const SizedBox(height: 24.0),

                Column(
                  children: [
                    TextFormField(
                      initialValue: "James Anderson",
                      readOnly: true,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        helperText: AppLocalizations.of(context).userProfileUsernameHelperText,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                      

                    TextFormField(
                      initialValue: "1999",
                      readOnly: true,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        helperText: AppLocalizations.of(context).userProfileBirthYearHelperText,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24.0),

                    TextFormField(
                      initialValue: "8000 PLN",
                      readOnly: true,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        helperText: AppLocalizations.of(context).userProfileAverageIncomeHelperText,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),

                    TextFormField(
                      initialValue: "2000 PLN",
                      readOnly: true,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        helperText: AppLocalizations.of(context).userProfileFreeCapitalHelperText,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ],   
                ),
              ], 
            ),
          ),
        ),
      ),
    );
  } 
}