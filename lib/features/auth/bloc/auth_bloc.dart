import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mylearning/features/auth/data/auth_repo.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepo;
  bool isDarkMode = false;

  AuthBloc({required this.authRepo}) : super(const AuthState()) {

    on<AuthCheckRequested>((event, emit) async {
      emit(const AuthState());
      authRepo.authStateChanges().listen((user) {
        if (user != null) {
          emit(const AuthState(authStatus: AuthStatus.authenticated));
        } else {
          emit(const AuthState(authStatus: AuthStatus.unauthenticated));
        }
      });
    });

    on<LogOut>((event, emit) async {
      await authRepo.logout();
      emit(const AuthState(authStatus: AuthStatus.unauthenticated));
    });

    on<ToggleThemeEvent>((event, emit) {
      isDarkMode = !isDarkMode;
      emit(AuthState(isDarkMode: isDarkMode));
    });
  }
}
