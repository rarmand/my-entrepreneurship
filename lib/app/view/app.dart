import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_entrepreneurship/app/view/app_view.dart';
import 'package:my_entrepreneurship/theme/provider/theme_provider.dart';
import 'package:my_entrepreneurship/user_form/bloc/user_form_bloc.dart';
import 'package:provider/provider.dart';
import 'package:user_repository/user_repository.dart';

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
          // TODO: gdzie ustalany user?
          BlocProvider(
            create: (context) => UserFormBloc(
              initialUser: User(),
              userRepository: RepositoryProvider.of<UserRepository>(context)
            ),
          ),
        ],
      
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ThemeProvider(),
            ),
          ],
          child: const AppView(),
        ),
      ),
    );
  }
}

