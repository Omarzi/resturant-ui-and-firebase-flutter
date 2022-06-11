import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_with_fb/constant.dart';
import 'package:food_app_with_fb/screens/widgets/custom_splash_screen/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SpState();
}

class _SpState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor.withOpacity(0.99),
      body: SplashBody(),
    );
  }
}
