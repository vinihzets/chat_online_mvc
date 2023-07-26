import 'package:flutter/material.dart';

class DecoratedTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const DecoratedTextField(
      {required this.label, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }
}
