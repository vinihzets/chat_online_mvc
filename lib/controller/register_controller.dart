import 'package:flutter/material.dart';
import 'package:training/auth/register_repository.dart';
import 'package:training/core/utils/const_routes.dart';

class RegisterController {
  RegisterRepository repository;
  ConstRoutes routes;
  RegisterController(this.repository, this.routes);

  Future signUp(
      String email, String password, String name, BuildContext context) async {
    final request = await repository.signUp(email, password, name);

    request.fold((l) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.message)));
    }, (r) {
      Navigator.of(context).pushNamed(routes.loginPageView);
    });
  }

  navigateToLogin(BuildContext context) {
    Navigator.of(context).pushNamed(routes.loginPageView);
  }
}
