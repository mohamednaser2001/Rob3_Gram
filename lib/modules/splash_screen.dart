import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rob3_gram/modules/on_boarding_screen.dart';
import 'package:rob3_gram/shared/constants.dart';
import 'package:rob3_gram/shared/methods/navigation_method.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
      const Duration(seconds: 1, milliseconds: 200),
          () => navigateTo(context, OnBoardingScreen()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('$imagePath/logo.png'),
          ],
        ),
      ),
    );
  }
}