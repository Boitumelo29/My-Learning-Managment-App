import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylearning/common_widgets/screens/user_layout/user_layout_screen.dart';
import 'package:mylearning/common_widgets/sized_box/sized_space.dart';
import 'package:mylearning/common_widgets/widgets/buttons/long_button.dart';
import 'package:mylearning/common_widgets/widgets/textfield/textfields.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/auth_row.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/email.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/forget_password.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/have_an_account.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/logo_image.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/mylearning_text.dart';
import 'package:mylearning/features/user/user_login/presentation/widget/password.dart';
import 'package:mylearning/util/constants/strings/strings.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback show;

  const LoginPage({super.key, required this.show});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  FocusNode emailFocus = FocusNode();
  TextEditingController password = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  bool isLoading = false;
  bool isForgotPasswordLoading = false;

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(height: 10,),
                LoginPassword(
                  password: password,
                  passwordFocus: passwordFocus,
                ),
                LoginForgetPassword(onTap: () {
                  forgotPassword();
                }),
                LongButton(
                  isLoading: isLoading,
                  onTap: () {
                    emailFocus.unfocus();
                    passwordFocus.unfocus();
                    if (_formKey.currentState!.validate()) {
                      _login();
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
  }

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Successfully logged in!'),
        backgroundColor: Colors.red,
      ));
      print("Logged in: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Login failed"),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to sign up: $e')));
      setState(() {
        isLoading = false;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  forgotPassword() {
    TextEditingController resetPasswordController = TextEditingController();

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 240,
              width: 480,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Merriweather',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "No Worries, we'll send you reset instructions",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LongTextFieldForm(
                    controller: resetPasswordController,
                    onChanged: (value) {},
                    hintText: "Please enter your email address",
                    labelText: "Email",
                    showSuffixIcon: false,
                    showPrefixIcon: true,
                    prefixIcon: Icons.email,
                    validator: (value) {},
                    obsureText: false,
                    isRed: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LongButton(
                      isLoading: isForgotPasswordLoading,
                      onTap: () async {
                        await resetPassword(resetPasswordController.text);
                        print(resetPasswordController.text);
                      },
                      title: "Reset Password"),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> resetPassword(String email) async {
    setState(() {
      isForgotPasswordLoading = true;
    });
    try {
      print("I am trying");
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            " Reset instructions have been sent to $email, please check your emails"),
        backgroundColor: Colors.yellow,
        duration: const Duration(seconds: 5),
      ));
      setState(() {
        isForgotPasswordLoading = false;
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Oops and error has occurred: $e"),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      ));
      setState(() {
        isForgotPasswordLoading = false;
      });
    } finally {
      setState(() {
        isForgotPasswordLoading = false;
      });
    }
  }
}
