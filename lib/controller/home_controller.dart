import 'package:flutter/material.dart';
import 'package:training/auth/home_repository.dart';
import 'package:training/core/utils/const_routes.dart';
import 'package:training/core/utils/hud_mixins.dart';

class HomeController with HudMixins {
  HomeRepository repository;
  ConstRoutes routes;
  HomeController(this.repository, this.routes);

  void signOut(BuildContext context) async {
    final request = await repository.signOut();

    request.fold((l) {
      showSnack(context, l.message, Colors.red);
    }, (r) {
      navigateNamedRemoveUntil(routes.loginPageView, context);
    });
  }
}
