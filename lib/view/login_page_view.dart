import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:training/controller/login_controller.dart';
import 'package:training/widgets/decorated_text_field.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late LoginController controller;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    controller = GetIt.I.get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Efetue o login'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedTextField(
                  label: 'E-mail', controller: emailController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedTextField(
                  label: 'Password', controller: passwordController),
            ),
            FilledButton(
                onPressed: () => controller.signIn(
                    emailController.text, passwordController.text, context),
                child: const Icon(Icons.arrow_right_alt))
          ],
        ),
      ),
    );
  }
}
