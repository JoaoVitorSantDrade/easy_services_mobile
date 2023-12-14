import 'dart:math';

import 'package:easy_services/buttons/mainButton.dart';
import 'package:easy_services/components/dropdownFormField.dart';
import 'package:easy_services/components/loginFormField.dart';
import 'package:easy_services/models/easyUserModel.dart';
import 'package:easy_services/providers/auth_provider.dart';
import 'package:easy_services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends ConsumerState<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<String> _selectedItem =
      ValueNotifier<String>("Prestador");

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: DropDownEasyService(selectedItem: _selectedItem),
          ),
          LoginFormField(
            formName: "Nome Completo",
            icon: Icons.abc,
            controller: _nameController,
            obscureText: false,
            keytype: TextInputType.name,
          ),
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
          Container(
            height: 50,
            width: 200,
            margin: const EdgeInsets.only(top: 40, bottom: 20),
            child: MainButton(
              buttonText: "Cadastre-se",
              callback: () => submitRegisterLite(
                  context,
                  ref,
                  _formKey,
                  _selectedItem,
                  _nameController,
                  _emailController,
                  _passwordController),
            ),
          )
        ]),
      ),
    );
  }
}

submitRegisterLite(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    ValueNotifier<String> valueNotifier,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController passwordController) async {
  if (formKey.currentState!.validate()) {
    try {
      easyUserModel user = easyUserModel(
          userId: Random.secure().nextInt(90000),
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          userType: valueNotifier.value);

      ref.read(easyUserProvider.notifier).state = user;
      ref.read(isAuthenticatedProvider.notifier).state = true;
      Navigator.pushNamed(context, '/sucessRegister');
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Erro ao avançar",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          textColor: Theme.of(context).colorScheme.error,
          fontSize: 16.0);
    }
  }
}
