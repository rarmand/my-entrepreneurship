import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_entrepreneurship/base/cubit/base_cubit.dart';

import 'base_view.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BaseCubit()),
      ],
      child: const BaseView(),
    );
  }
}
