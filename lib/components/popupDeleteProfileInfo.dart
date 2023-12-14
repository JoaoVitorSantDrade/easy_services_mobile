import 'package:easy_services/buttons/mainButton.dart';
import 'package:easy_services/buttons/secondaryButton.dart';
import 'package:easy_services/components/leftSheet.dart';
import 'package:easy_services/components/loginFormField.dart';
import 'package:easy_services/hooks/sqlLite_service_hook.dart';
import 'package:easy_services/models/easyUserModel.dart';
import 'package:easy_services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopupDeleteProfileInfo extends ConsumerStatefulWidget {
  const PopupDeleteProfileInfo({super.key});

  @override
  ConsumerState<PopupDeleteProfileInfo> createState() =>
      PopupDeleteProfileInfoState();
}

class PopupDeleteProfileInfoState
    extends ConsumerState<PopupDeleteProfileInfo> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                LoginFormField(
                    formName: "Senha",
                    icon: Icons.lock,
                    controller: passwordController,
                    obscureText: false,
                    keytype: TextInputType.visiblePassword)
              ],
            ),
            SecondaryButton(
                buttonText: "Deletar",
                callback: () => deleteInfo(context, ref, passwordController))
          ],
        ),
      ),
    );
  }
}

deleteInfo(BuildContext context, WidgetRef ref,
    TextEditingController passwordController) {
  easyUserModel oldUser = ref.watch(easyUserProvider);
  if (oldUser.password == passwordController.text) {
    SqliteService().deleteUser(oldUser.userId);
  }
  logout(context, ref);
}
