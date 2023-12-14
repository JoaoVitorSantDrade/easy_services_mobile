import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String buttonText;
  final Function callback;

  const MainButton(
      {super.key, required this.buttonText, required this.callback});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => callback(),
      style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.all(Theme.of(context).primaryColorLight),
        fixedSize: MaterialStateProperty.all(
            const Size(200.0, 40.0)), // Set your desired width and height
      ),
      child:
          Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
