import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 320,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Ao fazer login ou se registrar, você concordou com ',
              style: TextStyle(
                  color: Color(0xFF242323),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1,
                  decoration: TextDecoration.none),
            ),
            TextSpan(
              text: 'os Termos e Condições',
              style: TextStyle(
                  color: Color(0xFF0D6EFF),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1,
                  decoration: TextDecoration.none),
            ),
            TextSpan(
              text: ' e a ',
              style: TextStyle(
                  color: Color(0xFF242323),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1,
                  decoration: TextDecoration.none),
            ),
            TextSpan(
              text: 'Política de Privacidade.',
              style: TextStyle(
                  color: Color(0xFF0D6EFF),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
