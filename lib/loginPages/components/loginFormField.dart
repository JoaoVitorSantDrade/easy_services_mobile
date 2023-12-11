import 'package:flutter/material.dart';

class LoginFormField extends StatelessWidget {
  final String formName;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keytype;
  const LoginFormField(
      {super.key,
      required this.formName,
      required this.icon,
      required this.controller,
      required this.obscureText,
      required this.keytype});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            constraints: const BoxConstraints(minWidth: 100),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
            ),
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            hintText: "Digite $formName",
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            labelText: formName),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$formName é necessário';
          }
          return null;
        },
      ),
    );
  }
}
