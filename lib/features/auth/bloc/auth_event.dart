part of 'auth_bloc.dart';


abstract class AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class LogOut extends AuthEvent {}

class ToggleThemeEvent extends AuthEvent {}
