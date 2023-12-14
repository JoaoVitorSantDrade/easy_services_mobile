import 'package:easy_services/components/leftSheet.dart';
import 'package:easy_services/components/loginFormField.dart';
import 'package:easy_services/hooks/text_hook.dart';
import 'package:easy_services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:side_sheet/side_sheet.dart';

class HomeTopBar extends ConsumerStatefulWidget {
  const HomeTopBar({super.key});

  @override
  HomeTopBarState createState() => HomeTopBarState();
}

class HomeTopBarState extends ConsumerState<HomeTopBar> {
  late String seuNome;

  @override
  void initState() {
    super.initState();
    seuNome = ref.read(easyUserProvider).name;
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const ShapeDecoration(
              gradient: LinearGradient(
                  end: Alignment(0.76, -0.66),
                  begin: Alignment(-0.76, 0.66),
                  colors: [
                    Color(0xFC0D6EFF),
                    Color(0xFC0D6EFF),
                    Color(0xC90D6EFF),
                    Color(0xF47EB1FF)
                  ]),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Material(
              borderRadius: BorderRadius.circular(25),
              clipBehavior: Clip.antiAlias,
              color: Colors.transparent,
              child: InkWell(
                splashColor: Theme.of(context).primaryColor,
                onTap: () =>
                    SideSheet.left(body: const LeftSheet(), context: context),
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.menu,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Container(
              decoration: const ShapeDecoration(
                color: Colors.amber,
                shape: CircleBorder(eccentricity: 0.1),
              ),
              height: 50,
              width: 50,
            ),
          ),
          Positioned(
            height: 200,
            bottom: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Text(
                    "Venha encontrar seu prestador de serviço!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: LoginFormField(
                      formName: "Serviços",
                      icon: Icons.search_rounded,
                      controller: searchController,
                      obscureText: false,
                      keytype: TextInputType.name),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
