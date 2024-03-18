import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_entrepreneurship/app/view/app_view.dart';
import 'package:my_entrepreneurship/user_form/bloc/user_form_bloc.dart';
import 'package:user_repository/user_repository.dart';

// if any bloc is not used multiple times
// it can be provided in specific view, not in main app view
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => UserRepository()),
      ],

      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserFormBloc(), // userRepository: RepositoryProvider.of<UserRepository>(context)),
          ),
        ],
      
        child: const AppView(),
      )
    );
  }
}

