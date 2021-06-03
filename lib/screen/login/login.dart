import 'package:flutter/material.dart';

import 'component/body.dart';

class Login extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
