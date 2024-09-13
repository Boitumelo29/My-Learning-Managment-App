import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  bool isDarkMode = false;

  AuthBloc() : super(AuthInitial()) {

    // Handle the AuthCheckRequested event
    on<AuthCheckRequested>((event, emit) async {
      emit(AuthInitial());

      // Listen for auth state changes and emit the corresponding state
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user != null) {
          emit(Authenticated());
        } else {
          emit(Unauthenticated());
        }
      });
    });

    // Handle the LoggedOut event
    on<LoggedOut>((event, emit) async {
      await FirebaseAuth.instance.signOut();
      // Emit Unauthenticated state after logout
      emit(Unauthenticated());
    });

    // Handle the ToggleThemeEvent
    on<ToggleThemeEvent>((event, emit) {
      isDarkMode = !isDarkMode;
      // Emit updated ThemeState with the new isDarkMode value
      emit(ThemeState(isDarkMode: isDarkMode));
    });
  }
}
