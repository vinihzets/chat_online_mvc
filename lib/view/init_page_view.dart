import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:training/controller/register_controller.dart';
import 'package:training/widgets/decorated_text_field.dart';

class InitPageView extends StatefulWidget {
  const InitPageView({super.key});

  @override
  State<InitPageView> createState() => _InitPageViewState();
}

class _InitPageViewState extends State<InitPageView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late RegisterController controller;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    controller = GetIt.I.get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Faça seu registro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  DecoratedTextField(label: 'Nome', controller: nameController),
            ),
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
                onPressed: () => controller.navigateToLogin(context),
                child: const Text('Voce já possui cadastro?'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.signUp(emailController.text,
            passwordController.text, nameController.text, context),
        tooltip: 'Increment',
        child: const Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
