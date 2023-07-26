import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:training/core/injector/inject.dart';
import 'package:training/core/services/firebase_initialize.dart';
import 'package:training/core/utils/const_routes.dart';
import 'package:training/core/utils/routes_builder.dart';

void main() async {
  Injector.build();

  await FirebaseInitialize.build();

  runApp(const InitializeApp());
}

class InitializeApp extends StatefulWidget {
  const InitializeApp({super.key});

  @override
  State<InitializeApp> createState() => _InitializeAppState();
}

class _InitializeAppState extends State<InitializeApp> {
  late ConstRoutes routes;

  @override
  void initState() {
    routes = GetIt.I.get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: Routes.build(routes),
      initialRoute: routes.initPageView,
    );
  }
}
