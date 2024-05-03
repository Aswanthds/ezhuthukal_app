import 'dart:async';
import 'package:ezhuthukal_app/view/login/login.dart';
import 'package:ezhuthukal_app/view/main_page_nav.dart';
import 'package:ezhuthukal_app/model/functions/sessions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    divertPAge();
    super.initState();
  }

  void divertPAge() async {
    if (await isLoggedIn()) {
      Future.delayed(
        Durations.extralong1,
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const MainPageNav(),
            ),
            (route) => false),
      );
    } else {
      Future.delayed(
        Durations.extralong1,
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            (route) => false),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("CENTER TITLE")),
    );
  }
}
