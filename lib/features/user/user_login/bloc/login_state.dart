part of 'login_bloc.dart';

final class LoginState extends Equatable {
  final bool isLoading;
  final Option<Either<Failure, Unit>> loginFailureOrUnit;
  final Option<Either<Failure, Unit>> forgotPasswordFailureOrUnit;

  const LoginState(
      {this.loginFailureOrUnit = const None(),
      this.forgotPasswordFailureOrUnit = const None(),
      this.isLoading = false});

  @override
  List<Object> get props =>
      [loginFailureOrUnit, isLoading, forgotPasswordFailureOrUnit];
}
