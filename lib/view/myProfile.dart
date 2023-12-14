import 'package:easy_services/buttons/easyIconButton.dart';
import 'package:easy_services/components/popupDeleteProfileInfo.dart';
import 'package:easy_services/components/popupUpdateProfileInfo.dart';
import 'package:easy_services/components/profileInfo.dart';
import 'package:easy_services/components/profilePhoto.dart';
import 'package:easy_services/components/topBar.dart';
import 'package:easy_services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyProfile extends ConsumerStatefulWidget {
  const MyProfile({super.key});

  @override
  ConsumerState<MyProfile> createState() => MyProfileState();
}

class MyProfileState extends ConsumerState<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TopBar(text: "Agendamento"),
            const ProfilePhoto(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ProfileInfo("Email", ref.watch(easyUserProvider).email),
                    ProfileInfo("Senha", ref.watch(easyUserProvider).password),
                    ProfileInfo("Tipo de Usuário",
                        ref.watch(easyUserProvider).userType),
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EasyIconButton(
                      buttonText: "Atualizar dados",
                      callback: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext builder) {
                              return const AlertDialog(
                                content: PopupUpdateProfileInfo(),
                              );
                            });
                      },
                      icon: Icons.update_rounded),
                  EasyIconButton(
                      buttonText: "Deletar conta",
                      callback: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext builder) {
                              return const AlertDialog(
                                content: PopupDeleteProfileInfo(),
                              );
                            });
                      },
                      icon: Icons.delete_forever_rounded),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
