import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';
import 'package:uuid/uuid.dart';

part 'user_form_event.dart';
part 'user_form_state.dart';

// TODO: determine the flow of creating user profile!!!

// TODO: determine when and how to create a user id 
// before user form or with user form

class UserFormBloc extends Bloc<UserFormEvent, UserFormState>{
  UserFormBloc({
    required UserRepository userRepository,
  }): _userRepository = userRepository, 
      super(UserFormState.initial()) {
    on<UserFormSubmitted>(_onSubmitted);
    on<UserFormUpdated>(_onUserFormUpdated);
  }

  final UserRepository _userRepository;
  
  Future<void> _onUserFormUpdated(UserFormUpdated event, Emitter<UserFormState> emit) async {
    final userData = event.userData;

    print("Bloc ${userData['birthYear'].runtimeType}");
    User finalUser = User(
    id: const Uuid().v4(),
    isNewUser: false,
    username: userData['username'],
    birthYear: userData['birthYear'],
    avgMonthlyIncome: userData['avgMonthlyIncome'],
    incomeCurrency: userData['incomeCurrency'],
    incomeRegistrationDate: userData['incomeRegistrationDate'],
    freeAmount: userData['freeAmount'],
    );

    print("User created ${finalUser}");

    emit(state.copyWith(user: finalUser, status: UserFormStatus.userUpdated));
  }

  void _onSubmitted(UserFormSubmitted event, Emitter<UserFormState> emit) {}

  // Future<User?> _tryGetUser() async {
  //   try {
  //     final user = await _userRepository.getUser();
  //     return user;
  //   } catch (_) {
  //     return null;
  //   }
  // }
}