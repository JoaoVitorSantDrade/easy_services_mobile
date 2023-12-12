import 'package:easy_services/buttons/forgotPasswordButton.dart';
import 'package:easy_services/buttons/mainButton.dart';
import 'package:easy_services/components/loginFormField.dart';
import 'package:flutter/material.dart';
import 'package:easy_services/hooks/submit_login_hook.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(children: [
          LoginFormField(
            formName: "Email",
            icon: Icons.email,
            controller: _emailController,
            obscureText: false,
            keytype: TextInputType.emailAddress,
          ),
          LoginFormField(
            formName: "Senha",
            icon: Icons.password,
            controller: _passwordController,
            obscureText: true,
            keytype: TextInputType.visiblePassword,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ForgotPasswordButton()],
          ),
          Container(
            height: 40,
            width: 200,
            margin: const EdgeInsets.only(top: 50),
            child: MainButton(
              buttonText: "Entrar",
              callback: () => submitLoginLite(
                  context, _formKey, _emailController, _passwordController),
            ),
          )
        ]),
      ),
    );
  }
}
