import 'package:flutter/material.dart';
import 'package:training/core/utils/const_routes.dart';
import 'package:training/view/home_page_view.dart';
import 'package:training/view/login_page_view.dart';

import '../../view/init_page_view.dart';

class Routes {
  static build(ConstRoutes routes) {
    return <String, WidgetBuilder>{
      routes.initPageView: (context) => const InitPageView(),
      routes.homePageView: (context) => const HomePageView(),
      routes.loginPageView: (context) => const LoginPageView(),
    };
  }
}
