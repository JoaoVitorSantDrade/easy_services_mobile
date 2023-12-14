import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String text;
  const TopBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: 200,
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge,
            maxLines: 1,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
