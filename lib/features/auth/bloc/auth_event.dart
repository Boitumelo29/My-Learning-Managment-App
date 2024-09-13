part of 'auth_bloc.dart';

@immutable
// auth_event.dart
abstract class AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class LoggedOut extends AuthEvent {}

class ToggleThemeEvent extends AuthEvent {}
