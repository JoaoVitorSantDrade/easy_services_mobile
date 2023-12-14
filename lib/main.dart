import 'package:easy_services/hooks/sqlLite_service_hook.dart';
import 'package:easy_services/view/addressInfo.dart';
import 'package:easy_services/view/homePage.dart';
import 'package:easy_services/view/myProfile.dart';
import 'package:easy_services/view/personalInfo.dart';
import 'package:easy_services/view/successRegisterPage.dart';
import 'package:easy_services/view/startPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  // ));

  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //await SqliteService().dropAndRecreateTable();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Services',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0D6EFF), background: Colors.white),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Color(0xFF0D6EFF),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 24.0,
            height: 1.5,
          ),
          titleSmall: TextStyle(
            color: Color(0xFF4B5563),
            fontFamily: 'Inter',
            fontWeight: FontWeight.normal,
            fontSize: 14.0,
            height: 1.5,
          ),
          labelLarge: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            height: 1.5,
          ),
        ),
      ),
      home: const Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: StartPage(),
      ),
      routes: {
        '/startPage': (context) => const Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false,
              body: StartPage(),
            ),
        '/sucessRegister': (context) => const SuccessRegisterPage(),
        '/personalinfo': (context) => const PersonalInfo(),
        '/address': (context) => const AddressInfo(),
        '/home': (context) => const HomePage(),
        '/myProfile': (context) => const MyProfile(),
      },
    );
  }
}
