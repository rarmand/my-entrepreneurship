import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_entrepreneurship/base/cubit/base_cubit.dart';
import 'package:my_entrepreneurship/budget/view/view.dart';
import 'package:my_entrepreneurship/home/home.dart';
import 'package:my_entrepreneurship/l10n/l10n.dart';
import 'package:my_entrepreneurship/menu/menu.dart';
import 'package:my_entrepreneurship/user_form/user_form.dart';
import 'package:my_entrepreneurship/user_profile/user_profile.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPageIndex = context.select((BaseCubit cubit) => cubit.state.pageIndex);

    return MultiBlocListener(
      listeners: [
        BlocListener<BaseCubit, BaseState>(
          listener: (context, state) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        )
      ], 
      child: Scaffold(
        body: IndexedStack(
          index: selectedPageIndex,
          children: const [
            HomePage(),
            BudgetPage(),
            UserProfilePage(),
            UserForm(),
          ],
        ),
        bottomNavigationBar: Menu(
          selectedIndex: selectedPageIndex, 
          onDestinationSelected: (value) => context.read<BaseCubit>().setPageIndex(value),
        ),
      ),
    );
  } 
}