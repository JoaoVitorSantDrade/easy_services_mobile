import 'package:easy_services/loginPages/components/loginForm.dart';
import 'package:flutter/material.dart';

class LoginBottomSeet extends StatelessWidget {
  const LoginBottomSeet({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 40),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
          ),
          child: Column(children: [
            Text(
              "Entrar",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: "Inter",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const LoginForm()
          ]),
        );
      },
    );
  }
}
