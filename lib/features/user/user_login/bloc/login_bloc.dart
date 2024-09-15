import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mylearning/features/auth/data/auth_repo.dart';
import 'package:mylearning/main.dart';
import 'package:mylearning/network/failures/failures.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo = getIt<AuthRepository>();

  LoginBloc() : super(const LoginState()) {
    on<LoginUser>((event, emit) async {
      emit(const LoginState(isLoading: true));
      final eitherFailureOrUnit =
          await authRepo.loginUser(event.username, event.password);

      eitherFailureOrUnit.fold((failure) {
        emit(LoginState(
            isLoading: false,
            loginFailureOrUnit:
                some(left(Failure.authFailure(code: "$failure")))));
      }, (_) {
        emit(LoginState(
          isLoading: false,
          loginFailureOrUnit: some(right(unit)),
        ));
      });
    });

    on<ForgotPassword>((event, emit) async {
      final eitherFailureOrUnit = await authRepo.forgotPassword(event.email);

      eitherFailureOrUnit.fold((failure) {
        emit(LoginState(
            isLoading: false,
            forgotPasswordFailureOrUnit:
                some(left(Failure.authFailure(code: "$failure")))));
      }, (_) {
        emit(LoginState(
          isLoading: false,
          forgotPasswordFailureOrUnit: some(right(unit)),
        ));
      });
    });
  }
}
