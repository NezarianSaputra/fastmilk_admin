import 'package:fastmilk_admin/component/default_button.dart';
import 'package:fastmilk_admin/screen/homepage/home_page.dart';
import 'package:fastmilk_admin/screen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: SizedBox(
            child: Image.asset(
              'assets/images/logo.png',
              width: SizeConfig.blockSizeHorizontal * 50,
              height: SizeConfig.blockSizeHorizontal * 50,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal * 10,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.blockSizeHorizontal * 10),
                ),
                Text(
                  "SELAMAT DATANG",
                  style: TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Silahkan Pantau Bisnis Anda",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.blockSizeHorizontal * 15),
                ),
                DefaultButton(
                  text: "Mulai",
                  press: () {
                    Navigator.pushNamed(context, HomePage.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
