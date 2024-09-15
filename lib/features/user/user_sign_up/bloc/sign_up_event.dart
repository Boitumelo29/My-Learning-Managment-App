part of 'sign_up_bloc.dart';

class SignUpEvent {}

class SignUpUser extends SignUpEvent {
  final String email;
  final String password;

  SignUpUser({required this.email, required this.password});
}
