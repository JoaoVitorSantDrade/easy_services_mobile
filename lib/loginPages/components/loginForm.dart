import 'package:easy_services/buttons/forgotPasswordButton.dart';
import 'package:easy_services/buttons/mainButton.dart';
import 'package:easy_services/loginPages/components/loginFormField.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
              callback: () => submitLoginForm(
                  context, _formKey, _emailController, _passwordController),
            ),
          )
        ]),
      ),
    );
  }
}

submitLoginForm(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController) {
  if (formKey.currentState!.validate()) {
    try {
      final userCredential = FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      if (context.mounted) {
        //Navigator.pushNamed(context, '/main', arguments: userCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? 'An error occurred'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
