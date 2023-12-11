import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String buttonText;
  final Function callback;

  const SecondaryButton(
      {super.key, required this.buttonText, required this.callback});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => callback(),
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        overlayColor:
            MaterialStateProperty.all(Theme.of(context).highlightColor),
        fixedSize: MaterialStateProperty.all(const Size(200.0, 40.0)),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).primaryColor),
      ),
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
