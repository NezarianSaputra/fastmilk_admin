import 'package:fastmilk_admin/component/default_button.dart';
import 'package:fastmilk_admin/constants.dart';
import 'package:fastmilk_admin/screen/data_barang/data_barang.dart';

import 'package:fastmilk_admin/screen/list_pegawai/data_pegawai.dart';
import 'package:fastmilk_admin/screen/login/login.dart';

import 'package:fastmilk_admin/screen/profile_admin/profile_admin.dart';
import 'package:fastmilk_admin/services/auth_login.dart';
import 'package:fastmilk_admin/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../home_page.dart';

class BodyHome extends StatefulWidget {
  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  // final auth = FirebaseAuth.instance;
  // FirebaseAuth auth = FirebaseAuth.instance;

  // final user = User;

  // signOut() async {
  //   await auth.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Image.asset('assets/images/logo.png',
                        width: 200, height: 200)),
                SizedBox(height: SizeConfig.blockSizeVertical * 3),
                Container(
                  width: SizeConfig.blockSizeHorizontal * 90,
                  height: SizeConfig.blockSizeVertical * 10,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ProfileAdmin.routeName);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xffF07028), Color(0xffFE931D)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 2),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal * 25),
                              child: Text(
                                "Profil",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 5),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 90,
                      height: SizeConfig.blockSizeVertical * 20,
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        onPressed: () {
                          Navigator.pushNamed(context, DataPegawai.routeName);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 3,
                            ),
                            SvgPicture.asset(
                              'assets/images/officer 1.svg',
                              width: SizeConfig.blockSizeVertical * 10,
                            ),
                            Text(
                              'Data Pegawai',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'ABeeZee1'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 5),
                    child: Container(
                      width: SizeConfig.blockSizeHorizontal * 90,
                      height: SizeConfig.blockSizeVertical * 20,
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        onPressed: () {
                          Navigator.pushNamed(context, DataBarang.routeName);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 3,
                            ),
                            SvgPicture.asset(
                              'assets/images/Logo_grocery.svg',
                              width: SizeConfig.blockSizeVertical * 10,
                            ),
                            Text(
                              'Data Barang',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'ABeeZee1'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
