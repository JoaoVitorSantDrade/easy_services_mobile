import 'package:easy_services/components/homeTopBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.4),
        child: const HomeTopBar(),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        top: false,
        left: false,
        right: false,
        child: Container(
          child: Placeholder(),
        ),
      ),
    ));
  }
}
