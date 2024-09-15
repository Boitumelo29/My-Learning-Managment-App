import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mylearning/features/auth/data/auth_repo.dart';
import 'package:mylearning/main.dart';
import 'package:mylearning/network/failures/failures.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo = getIt<AuthRepository>();

  SignUpBloc() : super(const SignUpState()) {
    on<SignUpUser>((event, emit) async {
      emit(const SignUpState(isLoading: true));
      final eitherFailureOrUnit =
          await authRepo.signUpUser(event.email, event.password);

      eitherFailureOrUnit.fold((failure) {
        emit(SignUpState(
            isLoading: false,
            signUpFailureOrUnit: some(
              left(Failure.authFailure(code: "$failure")),
            )));
      }, (_) {
        emit(SignUpState(
          isLoading: false,
          signUpFailureOrUnit: some(right(unit)),
        ));
      });
    });
  }
}
