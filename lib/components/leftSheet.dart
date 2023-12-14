import 'package:easy_services/buttons/easyIconButton.dart';
import 'package:easy_services/hooks/text_hook.dart';
import 'package:easy_services/models/easyAddressModel.dart';
import 'package:easy_services/models/easyUserModel.dart';
import 'package:easy_services/providers/auth_provider.dart';
import 'package:easy_services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LeftSheet extends ConsumerWidget {
  const LeftSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 150,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EasyIconButton(
                          buttonText: "Meu Perfil",
                          callback: () {
                            Navigator.pushNamed(context, '/myProfile');
                          },
                          icon: Icons.person_pin_rounded),
                      EasyIconButton(
                          buttonText: "Meus Agendamentos",
                          callback: () async {
                            await Fluttertoast.showToast(
                                msg: "Não implementado",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                textColor:
                                    Theme.of(context).colorScheme.primary,
                                fontSize: 16.0);
                          },
                          icon: Icons.schedule_rounded),
                      EasyIconButton(
                          buttonText: "Menssagens",
                          callback: () async {
                            await Fluttertoast.showToast(
                                msg: "Não implementado",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                textColor:
                                    Theme.of(context).colorScheme.primary,
                                fontSize: 16.0);
                          },
                          icon: Icons.chat_rounded)
                    ]),
              ),
              EasyIconButton(
                  buttonText: "Sair",
                  callback: () => logout(context, ref),
                  icon: Icons.exit_to_app_rounded)
            ]),
      ),
    );
  }
}

logout(BuildContext context, WidgetRef ref) async {
  String name = ref.watch(easyUserProvider).name;

  await Fluttertoast.showToast(
      msg: "Tchau ${capitalize(getFirstName(name))}!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      textColor: Theme.of(context).colorScheme.primary,
      fontSize: 16.0);

  ref.read(isAuthenticatedProvider.notifier).state = false;
  ref.read(easyUserProvider.notifier).state = easyUserModel.empty();
  ref.read(easyAddressProvider.notifier).state = easyAddressModel.empty();

  Navigator.of(context)
      .pushNamedAndRemoveUntil('/startPage', (Route<dynamic> route) => false);
}
