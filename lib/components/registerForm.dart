import 'package:easy_services/buttons/forgotPasswordButton.dart';
import 'package:easy_services/buttons/mainButton.dart';
import 'package:easy_services/components/dropdownFormField.dart';
import 'package:easy_services/components/loginFormField.dart';
import 'package:flutter/material.dart';
import 'package:easy_services/hooks/submit_login_hook.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<ConsumerStatefulWidget> {
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
            height: 40,
            width: 200,
            margin: const EdgeInsets.only(top: 50),
            child: MainButton(
              buttonText: "Criar usuário",
              callback: () => submitRegisterLite(
                  context,
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
