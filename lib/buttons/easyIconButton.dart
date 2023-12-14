import 'package:flutter/material.dart';

class EasyIconButton extends StatelessWidget {
  final String buttonText;
  final Function callback;
  final IconData icon;
  const EasyIconButton(
      {super.key,
      required this.buttonText,
      required this.callback,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => callback(),
      style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.all(Theme.of(context).primaryColorLight),
        fixedSize: MaterialStateProperty.all(
            const Size(200.0, 40.0)), // Set your desired width and height
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
