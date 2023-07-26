import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:training/controller/home_controller.dart';
import 'package:training/widgets/chat_screen.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late HomeController controller;

  @override
  void initState() {
    controller = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () => controller.signOut(context),
              child: const Text('Sair'))
        ],
      ),
      body: ChatScreen(),
    );
  }
}
