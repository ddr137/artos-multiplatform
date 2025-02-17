
import 'package:artos/services/user_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {

      if (event is UserGetByUsername) {

        try {

          emit(UserLoading());

          final users = await UserService().getUsersByUsername(event.username);
          
          emit(UserSuccess(users));

        } catch (e) {
          emit(UserFailed(e.toString()));
        }

      }

      if (event is UserGetRecent) {

        try {

          emit(UserLoading());

          final users = await UserService().getRecentUsers();

          emit(UserSuccess(users));

        } catch (e) {
          emit(UserFailed(e.toString()));
        }

      }

    });
  }
}
