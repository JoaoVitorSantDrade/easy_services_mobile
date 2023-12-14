import 'package:easy_services/buttons/mainButton.dart';
import 'package:easy_services/components/loginFormField.dart';
import 'package:easy_services/components/topBar.dart';
import 'package:easy_services/hooks/submit_login_hook.dart';
import 'package:easy_services/models/easyAddressModel.dart';
import 'package:easy_services/models/easyUserModel.dart';
import 'package:easy_services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressInfo extends ConsumerStatefulWidget {
  const AddressInfo({super.key});

  @override
  AddressInfoState createState() => AddressInfoState();
}

class AddressInfoState extends ConsumerState<AddressInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _neighboorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Hero(
                tag: "topBarInfo",
                child: TopBar(text: "Endereço"),
              ),
              Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LoginFormField(
                        formName: "CEP",
                        icon: Icons.numbers_rounded,
                        controller: _cepController,
                        obscureText: false,
                        keytype: TextInputType.number,
                      ),
                      LoginFormField(
                        formName: "Endereço",
                        icon: Icons.add_road_rounded,
                        controller: _addressController,
                        obscureText: false,
                        keytype: TextInputType.name,
                      ),
                      LoginFormField(
                        formName: "Numero da Residência",
                        icon: Icons.house_rounded,
                        controller: _numberController,
                        obscureText: false,
                        formatter: FilteringTextInputFormatter.digitsOnly,
                        keytype: TextInputType.number,
                      ),
                      LoginFormField(
                        formName: "Cidade",
                        icon: Icons.location_city_rounded,
                        controller: _cityController,
                        obscureText: false,
                        keytype: TextInputType.name,
                      ),
                      LoginFormField(
                        formName: "Bairro",
                        icon: Icons.add_business_rounded,
                        controller: _neighboorController,
                        obscureText: false,
                        keytype: TextInputType.name,
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
                      buttonText: "Concluir Cadastro",
                      callback: () => submitAddressInfoLite(
                          context,
                          ref,
                          _formKey,
                          _cepController,
                          _addressController,
                          _numberController,
                          _cityController,
                          _neighboorController)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

submitAddressInfoLite(
    BuildContext context,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    TextEditingController cepController,
    TextEditingController addressController,
    TextEditingController numberController,
    TextEditingController cityController,
    TextEditingController neighboorController) async {
  if (formKey.currentState!.validate()) {
    try {
      final easyUserModel userInProvider = ref.watch(easyUserProvider);
      userInProvider.setAddressProperties(neighboorController.text,
          cityController.text, addressController.text, numberController.text);

      ref.read(easyUserProvider.notifier).state = userInProvider;
      //submitRegisterDjango(context, ref);
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      print(e);
    }
  }
}
