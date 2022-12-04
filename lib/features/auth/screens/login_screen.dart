import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/common/widgets/custom_button.dart';
import 'package:flutter_doctor_app/common/widgets/custom_textformfield.dart';
import 'package:flutter_doctor_app/features/auth/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _signInFormKey = GlobalKey<FormState>();
  final AuthServices authServices = AuthServices();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // To be sure that we don't have any memory leaks
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signIn() {
    authServices.signIn(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 320,
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _signInFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: _passwordController,
                    hintText: 'Password',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'Log In',
              onTap: () => {
                if (_signInFormKey.currentState!.validate()) {signIn()}
              },
              color: Colors.lightGreen[500],
            ),
          ],
        ),
      ),
    );
  }
}
