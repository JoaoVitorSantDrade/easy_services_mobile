import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInfo extends ConsumerWidget {
  final String title;
  final String description;
  const ProfileInfo(this.title, this.description, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 80,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
          Text(
            description,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
