import 'package:easy_services/buttons/mainButton.dart';
import 'package:easy_services/buttons/secondaryButton.dart';
import 'package:easy_services/loginPages/components/bottomSheet.dart';
import 'package:easy_services/loginPages/components/termsAndCondition.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 100),
          color: Theme.of(context).colorScheme.background,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Image.asset('assets/images/mainIcon.png'),
                ),
                SizedBox(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text("Olá!",
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center),
                      Text(
                          "Antes de aproveitar o EasyServices, por favor, se registre!",
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 2,
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
                Container(
                  height: 140,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MainButton(
                        buttonText: "Entrar",
                        callback: () {
                          showModalBottomSheet(
                              context: context,
                              constraints: const BoxConstraints(
                                  maxHeight: 600, maxWidth: 500),
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return const LoginBottomSheet(
                                  type: "Entrar",
                                );
                              });
                        },
                      ),
                      SecondaryButton(
                        buttonText: "Criar Conta",
                        callback: () {
                          showModalBottomSheet(
                              context: context,
                              constraints: const BoxConstraints(
                                  maxHeight: 600, maxWidth: 500),
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return const LoginBottomSheet(
                                  type: "Registrar",
                                );
                              });
                        },
                      )
                    ],
                  ),
                ),
                const TermsAndCondition()
              ]),
        ),
      ),
    );
  }
}
