import 'package:easy_services/components/loginForm.dart';
import 'package:easy_services/components/registerForm.dart';
import 'package:flutter/material.dart';

class LoginBottomSheet extends StatefulWidget {
  final String type;
  const LoginBottomSheet({super.key, required this.type});

  @override
  State<StatefulWidget> createState() => _LoginBottomSheetState();
}

class _LoginBottomSheetState extends State<LoginBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BottomSheet(
        enableDrag: false,
        showDragHandle: false,
        onClosing: () {},
        builder: (BuildContext context) {
          return SingleChildScrollView(
            clipBehavior: Clip.antiAlias,
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(top: 40),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Column(children: [
                Text(
                  widget.type,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "Inter",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.type == 'Entrar')
                  const LoginForm()
                else if (widget.type == 'Registrar')
                  const RegisterForm(),
              ]),
            ),
          );
        },
      ),
    );
  }
}
