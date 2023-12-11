import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Forgot Password");
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          "Esqueceu a senha?",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
