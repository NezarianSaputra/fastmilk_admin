import 'package:fastmilk_admin/screen/profile_admin/component/body_profileadmin.dart';
import 'package:flutter/material.dart';

import 'component/body_profileadmin.dart';

class ProfileAdmin extends StatelessWidget {
  static String routeName = "/profileAdmin";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            'PROFILE Admin',
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFFE931D),
        ),
        body: BodyProfileAdmin());
  }
}
