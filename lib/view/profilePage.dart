import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_services/providers/user_provider.dart';
import 'package:easy_services/providers/auth_provider.dart';

class ProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(isAuthenticatedProvider);
    final email = ref.watch(emailProvider.notifier).state;
    final password = ref.watch(passwordProvider.notifier).state;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Email'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Is Authenticated: $isAuthenticated'),
            SizedBox(height: 20),
            Text('Email: $email'),
            SizedBox(height: 20),
            Text('Password: $password'),
          ],
        ),
      ),
    );
  }
}
