import 'package:easy_services/buttons/dropFileButton.dart';
import 'package:easy_services/buttons/mainButton.dart';
import 'package:easy_services/components/loginFormField.dart';
import 'package:easy_services/components/topBar.dart';
import 'package:easy_services/hooks/convertEasyToCliente.dart';
import 'package:easy_services/hooks/submit_login_hook.dart';
import 'package:easy_services/models/cliente_model.dart';
import 'package:easy_services/models/easyUserModel.dart';
import 'package:easy_services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonalInfo extends ConsumerStatefulWidget {
  const PersonalInfo({super.key});

  @override
  PersonalInfoState createState() => PersonalInfoState();
}

class PersonalInfoState extends ConsumerState<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _rgController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _telController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Hero(
                tag: "topBarInfo",
                child: TopBar(text: "Informações Pessoais"),
              ),
              Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginFormField(
                        formName: "RG",
                        icon: Icons.document_scanner,
                        controller: _rgController,
                        obscureText: false,
                        keytype: TextInputType.text,
                      ),
                      LoginFormField(
                        formName: "CPF",
                        icon: Icons.wysiwyg,
                        controller: _cpfController,
                        obscureText: false,
                        keytype: TextInputType.text,
                      ),
                      LoginFormField(
                        formName: "Data de Nascimento",
                        icon: Icons.cake_rounded,
                        controller: _birthController,
                        obscureText: false,
                        keytype: TextInputType.datetime,
                      ),
                      LoginFormField(
                        formName: "Telefone",
                        icon: Icons.numbers_rounded,
                        controller: _telController,
                        obscureText: false,
                        formatter: FilteringTextInputFormatter.digitsOnly,
                        keytype: TextInputType.phone,
                      ),
                      ref.watch(easyUserProvider).userType.contains("Prestador")
                          ? const DropFileButton()
                          : const SizedBox(
                              height: 100,
                              width: 200,
                            ),
                    ]),
              ),
              Hero(
                tag: "buttonInfo",
                child: Container(
                  height: 60,
                  width: 200,
                  margin: const EdgeInsets.only(top: 40, bottom: 20),
                  child: MainButton(
                      buttonText: "Próxima Etapa",
                      callback: () => submitPersonalInfoLite(
                          context,
                          ref,
                          _formKey,
                          _rgController,
                          _cpfController,
                          _birthController,
                          _telController)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

submitPersonalInfoLite(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController rgController,
    TextEditingController cpfController,
    TextEditingController birthController,
    TextEditingController telController) async {
  if (formKey.currentState!.validate()) {
    try {
      final easyUserModel userInProvider = ref.watch(easyUserProvider);
      userInProvider.setAdditionalProperties(rgController.text,
          cpfController.text, birthController.text, telController.text);

      await createUser(context, userInProvider);
      ref.read(easyUserProvider.notifier).state = userInProvider;
      Navigator.pushReplacementNamed(context, '/address');
    } catch (e) {
      print(e);
    }
  }
}

submitPersonalInfoDjango(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController rgController,
    TextEditingController cpfController,
    TextEditingController birthController,
    TextEditingController telController) {
  easyUserModel easyUser = ref.watch(easyUserProvider);
  ClienteModel clientToSend = convert(easyUser);
}
