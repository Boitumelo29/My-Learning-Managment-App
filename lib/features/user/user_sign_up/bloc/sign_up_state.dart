part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final Option<Either<Failure, Unit>> signUpFailureOrUnit;
  final bool isLoading;

  const SignUpState(
      {this.signUpFailureOrUnit = const None(), this.isLoading = false});

  @override
  List<Object> get props => [signUpFailureOrUnit, isLoading];
}
