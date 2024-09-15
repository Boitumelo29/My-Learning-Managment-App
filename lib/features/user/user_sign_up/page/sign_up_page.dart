import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/common_widgets/screens/user_layout/user_layout_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/auth_row.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/mylearning_text.dart';
import 'package:mylearning/features/user/user_sign_up/bloc/sign_up_bloc.dart';
import 'package:mylearning/features/user/user_sign_up/widget/SignupEmail.dart';
import 'package:mylearning/features/user/user_sign_up/widget/already_have_account.dart';
import 'package:mylearning/features/user/user_sign_up/widget/logo_image.dart';
import 'package:mylearning/features/user/user_sign_up/widget/signup_password.dart';
import 'package:mylearning/features/user/user_sign_up/widget/signup_username.dart';
import 'package:mylearning/util/constants/strings/strings.dart';
import 'package:mylearning/util/navigation/tab_bar.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback show;

  const SignUpPage({super.key, required this.show});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  FocusNode email_f = FocusNode();
  final username = TextEditingController();
  FocusNode username_f = FocusNode();
  final password = TextEditingController();
  FocusNode password_f = FocusNode();
  final passwordConfirm = TextEditingController();
  FocusNode passwordConfirm_f = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: _listener,
      builder: (context, state) {
        return UserLayoutScreen(
          children: [
            const MyLearningText(),
            const LogoImage(),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SignupUsername(username: username, username_f: username_f),
                    const SizedSpace(
                      height: 10,
                    ),
                    SignupEmail(email: email, email_f: email_f),
                    const SizedSpace(
                      height: 10,
                    ),
                    SignupPassword(password: password, password_f: password_f),
                    const SizedBox(
                      height: 10,
                    ),
                    LongButton(
                        isLoading: state.isLoading,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignUpBloc>().add(SignUpUser(
                                email: email.text, password: password.text));
                          }
                        },
                        title: Strings.signUp),
                    const SizedBox(
                      height: 10,
                    ),
                    const AuthRow(),
                    const SizedBox(
                      height: 10,
                    ),
                    AlreadyHaveAnAccount(onPressed: widget.show)
                  ],
                )),
          ],
        );
      },
    );
  }

  _listener(BuildContext context, SignUpState state) {
    state.signUpFailureOrUnit.fold(
        () {},
        (eitherFailureOrUnit) => eitherFailureOrUnit.fold((failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to sign up: $failure')));
            }, (_) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        TabBarScreen(isDarkMode: false, toggleTheme: () {}),
                  ));
              _showWelcomeDialog(context);
            }));
  }

  void _showWelcomeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Welcome! 👋 ${username.text}'),
          content: const Text(
              "Welcome to MyLearning! So happy to have you app, hope you have a great experience."),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
