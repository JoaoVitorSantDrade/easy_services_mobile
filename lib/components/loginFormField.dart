import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginFormField extends StatelessWidget {
  final String formName;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keytype;
  final TextInputFormatter? formatter;
  final TextStyle? textStyle;
  final bool? disableHints;

  const LoginFormField(
      {super.key,
      required this.formName,
      required this.icon,
      required this.controller,
      required this.obscureText,
      required this.keytype,
      this.formatter,
      this.textStyle,
      this.disableHints});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        clipBehavior: Clip.antiAlias,
        inputFormatters: formatter != null ? [formatter!] : null,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintMaxLines: 1,
          isDense: true,
          filled: true,
          prefixIcon: Icon(icon),
          constraints: const BoxConstraints(minWidth: 100),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
          ),
          alignLabelWithHint: true,
          hintStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          hintText: disableHints == null || disableHints == false
              ? "Digite $formName"
              : "",
          labelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          labelText: formName,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$formName é necessário';
          }
        },
      ),
    );
  }
}
