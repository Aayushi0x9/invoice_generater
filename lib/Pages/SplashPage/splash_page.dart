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
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
            'https://static.vecteezy.com/system/resources/thumbnails/004/572/128/small/invoice-line-icon-logo-illustration-free-vector.jpg'),
      ),
    );
  }
}
