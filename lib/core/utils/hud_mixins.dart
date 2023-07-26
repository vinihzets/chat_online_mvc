import 'package:flutter/material.dart';

mixin HudMixins {
  showSnack(BuildContext context, String title, Color? color) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title),
      backgroundColor: color,
    ));
  }

  navigateNamed(String routeName, BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  navigateNamedRemoveUntil(String routeName, BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
