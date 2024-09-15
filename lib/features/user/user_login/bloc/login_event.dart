part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginUser extends LoginEvent {
  final String username;
  final String password;

  LoginUser({required this.username, required this.password});
}

class ForgotPassword extends LoginEvent {
  final String email;

  ForgotPassword({required this.email});
}
