import 'package:flutter/material.dart';

import 'component/body.dart';

class LandingScreen extends StatelessWidget {
  static String routeName = '/landing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
