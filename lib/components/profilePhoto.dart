import 'package:easy_services/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePhoto extends ConsumerWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String userName = ref.watch(easyUserProvider).name;
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.amberAccent,
            height: 60,
            width: 60,
            margin: EdgeInsets.symmetric(vertical: 10),
          ),
          Text(
            userName,
            style: TextStyle(
                fontSize: 24, color: Theme.of(context).primaryColorDark),
          ),
        ],
      ),
    );
  }
}
