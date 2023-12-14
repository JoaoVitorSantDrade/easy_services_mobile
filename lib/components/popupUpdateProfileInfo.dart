import 'package:easy_services/buttons/secondaryButton.dart';
import 'package:easy_services/components/loginFormField.dart';
import 'package:easy_services/models/easyUserModel.dart';
import 'package:easy_services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_services/hooks/sqlLite_service_hook.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupUpdateProfileInfo extends ConsumerStatefulWidget {
  const PopupUpdateProfileInfo({super.key});

  @override
  ConsumerState<PopupUpdateProfileInfo> createState() =>
      PopupUpdateProfileInfoState();
}

class PopupUpdateProfileInfoState
    extends ConsumerState<PopupUpdateProfileInfo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                LoginFormField(
                    formName: "Nome",
                    icon: Icons.abc,
                    controller: nameController,
                    obscureText: false,
                    keytype: TextInputType.name),
                LoginFormField(
                    formName: "Email",
                    icon: Icons.mail,
                    controller: emailController,
                    obscureText: false,
                    keytype: TextInputType.emailAddress),
                LoginFormField(
                    formName: "Senha",
                    icon: Icons.lock,
                    controller: passwordController,
                    obscureText: false,
                    keytype: TextInputType.visiblePassword)
              ],
            ),
            SecondaryButton(
                buttonText: "Alterar",
                callback: () => updateInfo(context, ref, nameController,
                    emailController, passwordController))
          ],
        ),
      ),
    );
  }
}

updateInfo(
    BuildContext context,
    WidgetRef ref,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController passwordController) {
  easyUserModel oldUser = ref.watch(easyUserProvider);
  easyUserModel newUser = easyUserModel(
      userId: oldUser.userId,
      name: nameController.text == "" ? oldUser.name : nameController.text,
      email: emailController.text == "" ? oldUser.email : emailController.text,
      password: passwordController.text == ""
          ? oldUser.password
          : passwordController.text,
      userType: oldUser.userType);

  SqliteService().updateUser(newUser);
  ref.read(easyUserProvider.notifier).state = newUser;

  Fluttertoast.showToast(
      msg: "Dados Atualizados!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      textColor: Theme.of(context).colorScheme.primary,
      fontSize: 16.0);
  Navigator.pop(context);
}
