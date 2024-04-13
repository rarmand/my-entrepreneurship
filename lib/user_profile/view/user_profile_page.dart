import 'package:flutter/material.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';


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
            tooltip: "Change view mode",
            onPressed: () {
              // TODO: change view mode
              // TODO: change theme set
            }, 
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: "Edit profile",
            onPressed: () {
              // TODO: navigate to edition profile view
              // TODO: change theme set
            }, 
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.orange,
                ),
                const SizedBox(height: 10.0),

                Column(
                  children: [
                    TextFormField(
                      initialValue: "James Anderson",
                      readOnly: true,
                      enableSuggestions: false,
                      decoration: const InputDecoration(
                        helperText: "Username",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                      

                    TextFormField(
                      initialValue: "1999",
                      readOnly: true,
                      enableSuggestions: false,
                      decoration: const InputDecoration(
                        helperText: "Birth year",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),

                    TextFormField(
                      initialValue: "8000 PLN",
                      readOnly: true,
                      enableSuggestions: false,
                      decoration: const InputDecoration(
                        helperText: "Average income",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),

                    TextFormField(
                      initialValue: "2000 PLN",
                      readOnly: true,
                      enableSuggestions: false,
                      decoration: const InputDecoration(
                        helperText: "Free amount",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: UnderlineInputBorder(
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