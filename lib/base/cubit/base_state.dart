part of 'base_cubit.dart';

enum BaseState {
  home(0),
  savings(1),
  budget(2),
  userProfile(3);

  const BaseState(this.pageIndex);
  final int pageIndex;
}