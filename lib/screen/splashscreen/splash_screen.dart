import 'dart:async';

import 'package:fastmilk_admin/screen/landing_screen/landing_screen.dart';
import 'package:fastmilk_admin/screen/login/login.dart';
import 'package:fastmilk_admin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) {
          return LandingScreen();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: SizeConfig.blockSizeHorizontal * 50,
          height: SizeConfig.blockSizeVertical * 50,
        ),
      ),
    );
  }
}
