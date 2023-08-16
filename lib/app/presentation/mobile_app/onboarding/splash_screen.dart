
import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/constant.dart';
import '../../../../core/size_config.dart';
import 'login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
           const Login()
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 300,
              width: 300,
              child: Image.asset('images/gtb logo.png')
          ),
          ),
        ),
      );
  }

}
