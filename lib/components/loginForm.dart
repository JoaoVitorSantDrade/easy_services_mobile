import 'package:easy_services/buttons/forgotPasswordButton.dart';
import 'package:easy_services/buttons/mainButton.dart';
import 'package:easy_services/components/loginFormField.dart';
import 'package:flutter/material.dart';
import 'package:easy_services/hooks/submit_login_hook.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
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
            height: 50,
            width: 200,
            margin: const EdgeInsets.only(top: 40, bottom: 20),
            child: MainButton(
              buttonText: "Login",
              callback: () => submitLoginLite(context, ref, _formKey,
                  _emailController, _passwordController),
            ),
          )
        ]),
      ),
    );
  }
}
