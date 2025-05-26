import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/features/auth/domain/entities/user.dart';
import 'package:untitled2/features/auth/domain/usecases/user_login.dart';
import 'package:untitled2/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
}) : _userSignUp = userSignUp,
        _userLogin = userLogin,
     super(AuthInitial()) {
     on<AuthSignUp>(_onAuthSignUp);
     on<AuthLogin>(_onAuthLogin);
    }

    void _onAuthSignUp(AuthSignUp event,Emitter<AuthState> emit) async{
      emit(AuthLoading());
      final res = await _userSignUp(
          UserSignUpParams(
              email: event.email,
              name: event.name,
              password: event.password
          ));

      res.fold(
            (l) {
          print('SignUp error: ${l.message}');
          emit(AuthFailure(l.message));
        },
            (user) {
          print('SignUp succeeded');
          emit(AuthSuccess(user));
        },
      );
    }

  void _onAuthLogin(AuthLogin event,Emitter<AuthState> emit) async{
    emit(AuthLoading());
    final res = await _userLogin(UserLoginParams(
       email: event.email,
       password: event.password,
   ));

    res.fold((l) => emit(AuthFailure(l.message)),
            (user) => emit(AuthSuccess(user)));
  }
}