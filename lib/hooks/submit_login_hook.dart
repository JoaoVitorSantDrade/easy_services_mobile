import 'dart:developer';

import 'package:easy_services/models/easyUserModel.dart';
import 'package:easy_services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_services/hooks/sqlLite_service_hook.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';

submitLogin(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController) async {
  if (formKey.currentState!.validate()) {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      print(userCredential);
      if (context.mounted) {
        //Navigator.pushNamed(context, '/main', arguments: userCredential);
      }
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showAdaptiveDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("${e.message}", textAlign: TextAlign.center),
            );
          });
    }
  }
}

submitRegister(
    BuildContext context,
    GlobalKey<FormState> formKey,
    ValueNotifier<int> valueNotifier,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController passwordController) async {
  if (formKey.currentState!.validate()) {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showAdaptiveDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("${e.message}", textAlign: TextAlign.center),
            );
          });
    }
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
          userId: const Uuid().v6(),
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          userType: valueNotifier.value);
      await SqliteService().create(user);
      ref.read(emailProvider.notifier).state = user.email;
      ref.read(nameProvider.notifier).state = user.name;
      Fluttertoast.showToast(
          msg: "Usuário Criado com sucesso!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          textColor: Theme.of(context).colorScheme.primary,
          fontSize: 16.0);
      Navigator.pushNamed(context, '/dashboard');
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
        // User found, do something (e.g., navigate to rthe home screen)
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        print('Login successful');
      }
    } catch (e) {
      // Handle any exceptions
      print('Error during login: $e');
    }
  }
}
