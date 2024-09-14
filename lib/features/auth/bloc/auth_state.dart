part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  inProgress,
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final bool isDarkMode;

  const AuthState(
      {this.authStatus = AuthStatus.initial, this.isDarkMode = false});

  @override
  List<Object?> get props => [authStatus, isDarkMode];
}
