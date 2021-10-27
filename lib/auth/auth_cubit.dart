import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pooyesh/auth/auth_credentials.dart';
import 'package:pooyesh/session_cubit.dart';

enum AuthState { login, signUp, confirmSignUp }

class AuthCubit extends Cubit<AuthState> {
  final SessionCubit sessionCubit;

  AuthCubit({required this.sessionCubit}) : super(AuthState.login);
  AuthCredentials? credentials;


  void showLogin() => emit(AuthState.login);
  void showSignUp() => emit(AuthState.signUp);
  void showConfirmSignUp({
    required String username,
    required String email,
    required String password,
  }) {
    credentials = AuthCredentials(
      username: username,
      email: email,
      password: password, userId: '',
    );
    emit(AuthState.confirmSignUp);
  }

  void launchSession(AuthCredentials credentials) =>
      sessionCubit.showSession(credentials);
}