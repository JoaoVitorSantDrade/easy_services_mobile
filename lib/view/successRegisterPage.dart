import 'package:easy_services/buttons/mainButton.dart';
import 'package:easy_services/hooks/text_hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_services/providers/user_provider.dart';

class SuccessRegisterPage extends ConsumerWidget {
  const SuccessRegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String seuNome = ref.watch(easyUserProvider).name;

    return SafeArea(
      maintainBottomViewPadding: true,
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primaryContainer),
                child: Icon(
                  fill: 1,
                  size: 100,
                  Icons.done_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Sucesso",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: 200,
                child: Text(
                  textAlign: TextAlign.center,
                  "${capitalize(getFirstName(seuNome))}, para continuar seu cadastro é necessario fornecer mais algumas informações.",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: MainButton(
                    buttonText: "Continuar Cadastro",
                    callback: () {
                      Navigator.pushNamed(context, '/personalinfo');
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
