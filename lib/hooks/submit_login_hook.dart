import 'dart:math';

import 'package:easy_services/hooks/convertEasyToCliente.dart';
import 'package:easy_services/models/cliente_model.dart';
import 'package:easy_services/models/easyUserModel.dart';
import 'package:easy_services/providers/auth_provider.dart';
import 'package:easy_services/providers/user_provider.dart';
import 'package:easy_services/services/cliente_api_service.dart';
import 'package:flutter/material.dart';
import 'package:easy_services/hooks/sqlLite_service_hook.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

createUser(BuildContext context, easyUserModel user) async {
  try {
    await SqliteService().createUser(user);
    Fluttertoast.showToast(
        msg: "Usuário Criado com sucesso!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        textColor: Theme.of(context).colorScheme.primary,
        fontSize: 16.0);
  } catch (e) {
    Fluttertoast.showToast(
        msg: "Erro ao criar Usuário",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        textColor: Theme.of(context).colorScheme.error,
        fontSize: 16.0);
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

      await SqliteService().createUser(user);

      ref.read(easyUserProvider.notifier).state = user;
      ref.read(isAuthenticatedProvider.notifier).state = true;

      Fluttertoast.showToast(
          msg: "Usuário Criado com sucesso!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          textColor: Theme.of(context).colorScheme.primary,
          fontSize: 16.0);
      Navigator.pushNamed(context, '/sucessRegister');
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Erro ao criar Usuário",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          textColor: Theme.of(context).colorScheme.error,
          fontSize: 16.0);
    }
  }
}

submitLoginLite(
  BuildContext context,
  WidgetRef ref,
  GlobalKey<FormState> formKey,
  TextEditingController emailController,
  TextEditingController passwordController,
) async {
  if (formKey.currentState!.validate()) {
    try {
      List<easyUserModel> allUsers = await SqliteService().getUsers();
      easyUserModel? user = allUsers.firstWhere(
        (user) =>
            user.email == emailController.text &&
            user.password == passwordController.text,
      );

      if (user != null) {
        ref.read(easyUserProvider.notifier).state = user;
        ref.read(isAuthenticatedProvider.notifier).state = true;
        //ref.read(easyUserProvider.notifier).state pegar o estado dos endereços do banco de dados

        print('Login successful');
        await Fluttertoast.showToast(
            msg: "Olá, ${ref.watch(easyUserProvider).name}!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            textColor: Theme.of(context).colorScheme.primary,
            fontSize: 16.0);
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      print('Error during login: $e');
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          textColor: Theme.of(context).colorScheme.error,
          fontSize: 16.0);
    }
  }
}

submitLoginDjango(
  BuildContext context,
  GlobalKey<FormState> formKey,
  TextEditingController emailController,
  TextEditingController passwordController,
) async {
  if (formKey.currentState!.validate()) {
    try {
      final result = await ClienteApi()
          .loginCliente(emailController.text, passwordController.text);

      print('Login successful');
      await Fluttertoast.showToast(
          msg: "Bem-Vindo!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          textColor: Theme.of(context).colorScheme.primary,
          fontSize: 16.0);
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      print('Error during login: $e');
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          textColor: Theme.of(context).colorScheme.error,
          fontSize: 16.0);
    }
  }
}

submitRegisterDjango(
  BuildContext context,
  WidgetRef ref,
) async {
  try {
    easyUserModel eUser = ref.watch(easyUserProvider);
    await ClienteApi().createCliente(convert(eUser));

    print('Register successful');
    await Fluttertoast.showToast(
        msg: "Bem-Vindo!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        textColor: Theme.of(context).colorScheme.primary,
        fontSize: 16.0);
    Navigator.pushNamed(context, '/home');
  } catch (e) {
    print('Error during Register: $e');
    Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        textColor: Theme.of(context).colorScheme.error,
        fontSize: 16.0);
  }
}
