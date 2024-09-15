import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/common_widgets/screens/user_layout/user_layout_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/features/user/user_login/bloc/login_bloc.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/auth_row.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/email.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/fogotpassword.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/forget_password.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/have_an_account.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/logo_image.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/mylearning_text.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/password.dart';
import 'package:mylearning/util/constants/strings/strings.dart';
import 'package:mylearning/util/navigation/tab_bar.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback show;

  const LoginPage({super.key, required this.show});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  FocusNode emailFocus = FocusNode();
  TextEditingController password = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  bool isForgotPasswordLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: _listener,
      builder: (context, state) {
        return UserLayoutScreen(
          children: [
            const MyLearningText(),
            const SizedSpace(
              height: 40,
            ),
            const LogoImage(),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    LoginEmail(
                      email: email,
                      emailFocus: emailFocus,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LoginPassword(
                      password: password,
                      passwordFocus: passwordFocus,
                    ),
                    LoginForgetPassword(onTap: () {
                      forgotPassword(
                          context, setState, isForgotPasswordLoading);
                    }),
                    LongButton(
                      isLoading: state.isLoading,
                      onTap: () {
                        emailFocus.unfocus();
                        passwordFocus.unfocus();
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(LoginUser(
                              username: email.text, password: password.text));
                        }
                      },
                      title: Strings.login,
                    ),
                    const SizedSpace(
                      height: 10,
                    ),
                    const AuthRow(),
                    const SizedSpace(
                      height: 8,
                    ),
                    DontHaveAnAccount(onPressed: widget.show),
                  ],
                ))
          ],
        );
      },
    );
  }

  _listener(BuildContext context, LoginState state) {
    state.loginFailureOrUnit.fold(
      () {},
      (eitherFailureOrUnit) => eitherFailureOrUnit.fold((failure) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to sign up: $failure')));
      }, (_) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    TabBarScreen(isDarkMode: false, toggleTheme: () {})));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully logged in!'),
          backgroundColor: Colors.red,
        ));
      }),
    );

    ///todo forgot password
    state.forgotPasswordFailureOrUnit.fold(
        () {},
        (eitherFailureOrUnit) =>
            eitherFailureOrUnit.fold((failure) {}, (_) {}));
  }
}
