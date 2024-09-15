import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/features/auth/bloc/auth_bloc.dart';
import 'package:mylearning/features/user/user_login/bloc/login_bloc.dart';
import 'package:mylearning/features/user/user_login/presentation/pages/login_page.dart';
import 'package:mylearning/features/user/user_sign_up/bloc/sign_up_bloc.dart';
import 'package:mylearning/features/user/user_sign_up/page/sign_up_page.dart';
import 'package:mylearning/util/navigation/tab_bar.dart';

class AuthView extends StatelessWidget {
  final bool isDarkMode;
  final Function toggleTheme;

  const AuthView(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.authStatus == AuthStatus.authenticated) {
          return TabBarScreen(isDarkMode: isDarkMode, toggleTheme: toggleTheme);
        } else if (state.authStatus == AuthStatus.unauthenticated) {
          return const AuthPage();
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool a = true;

  void go() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return BlocProvider(
        create: (context) => LoginBloc(),
        child: LoginPage(
          show: go,
        ),
      );
    } else {
      return BlocProvider(
        create: (context) => SignUpBloc(),
        child: SignUpPage(show: go),
      );
    }
  }
}
