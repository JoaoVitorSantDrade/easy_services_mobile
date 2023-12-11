import 'package:easy_services/firebase_options.dart';
import 'package:easy_services/hooks/sqlLite_service_hook.dart';
import 'package:easy_services/loginPages/view/startPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SqliteService().dropAndRecreateTable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Services',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D6EFF)),
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
        resizeToAvoidBottomInset: false,
        body: StartPage(),
      ),
    );
  }
}
