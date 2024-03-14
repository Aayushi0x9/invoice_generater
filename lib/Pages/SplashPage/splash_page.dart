import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/routes_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.pushReplacementNamed(context, MyRotes.homePage);
        tick.cancel();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
            'https://w7.pngwing.com/pngs/227/9/png-transparent-logo-icon-green-leaf-logo-design-other-free-logo-design-template-leaf-thumbnail.png'),
      ),
    );
  }
}
