import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseState.home);

  void setPageIndex(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return emit(BaseState.home);
      case 1:
        return emit(BaseState.savings);
      case 2:
        return emit(BaseState.budget);
      case 3:
        return emit(BaseState.userProfile);
    }
  }
}