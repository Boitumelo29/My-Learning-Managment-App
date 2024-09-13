part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class ThemeState extends AuthState {
  final bool isDarkMode;

  ThemeState({required this.isDarkMode});
}
