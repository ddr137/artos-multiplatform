import 'dart:async';

import 'package:artos/models/sign_in_form_model.dart';
import 'package:artos/models/sign_up_form_model.dart';
import 'package:artos/models/user_model.dart';
import 'package:artos/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {

      if(event is AuthCheckEmail) {
        try {

          emit(AuthLoading());
          final res = await AuthService().checkEmail(event.email);
          if(!res) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email sudah terpakai'));
          }

        } catch(e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthRegister) {
        try {
          print('auth form register');

          emit(AuthLoading());

          final res = await AuthService().register(event.data);

          emit(AuthSuccess(res));
        } catch (e) {
          print(e.toString());
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final res = await AuthService().login(event.data);
          emit(AuthSuccess(res));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

    });
  }
}
