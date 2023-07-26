import 'package:flutter/material.dart';
import 'package:training/auth/login_repository.dart';
import 'package:training/core/services/auth_service.dart';
import 'package:training/core/utils/const_routes.dart';
import 'package:training/core/utils/hud_mixins.dart';

class LoginController with HudMixins {
  ConstRoutes routes;
  AuthService auth;
  LoginRepository repository;

  LoginController(this.routes, this.auth, this.repository);

  Future signIn(String email, String password, BuildContext context) async {
    final request = await repository.signIn(email, password);
    request.fold((l) {
      showSnack(context, l.message, Colors.red);
    }, (r) {
      navigateNamedRemoveUntil(routes.homePageView, context);
    });
  }
}
