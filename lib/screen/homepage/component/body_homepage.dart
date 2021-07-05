import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastmilk_admin/component/default_button.dart';
import 'package:fastmilk_admin/constants.dart';
import 'package:fastmilk_admin/screen/data_barang/data_barang.dart';
import 'package:fastmilk_admin/screen/data_pesanan/data_pesanan.dart';
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
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final uid = user.uid;
    SizeConfig().init(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Selamat datang,",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.bold),
                              ),
                              StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('Admin')
                                      .doc(uid)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                          snapshot.data
                                              .data()['Nama_Admin']
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: "Nunito",
                                              fontWeight: FontWeight.bold));
                                    } else {
                                      return Text('Loading');
                                    }
                                  }),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Image.asset("assets/images/Bell.png"),
                          iconSize: 30,
                          onPressed: () {},
                        )
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 7),
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
                              borderRadius: BorderRadius.circular(18.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 400.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 4),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: SizeConfig.blockSizeVertical * 7,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal *
                                          23.5),
                                  child: Text(
                                    "Profil",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 90,
                        height: SizeConfig.blockSizeVertical * 10,
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          onPressed: () {
                            Navigator.pushNamed(context, DataPegawai.routeName);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/officer 1.svg',
                                width: SizeConfig.blockSizeVertical * 7,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left:
                                          SizeConfig.blockSizeHorizontal * 18),
                                  child: Text(
                                    'Data Pegawai',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 90,
                        height: SizeConfig.blockSizeVertical * 10,
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          onPressed: () {
                            Navigator.pushNamed(context, DataBarang.routeName);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/Logo_grocery.svg',
                                width: SizeConfig.blockSizeVertical * 7,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal *
                                          19.5),
                                  child: Text(
                                    'Data Barang',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 90,
                        height: SizeConfig.blockSizeVertical * 10,
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          onPressed: () {
                            Navigator.pushNamed(context, DataPesanan.routeName);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/toko.png',
                                width: SizeConfig.blockSizeVertical * 7,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left:
                                          SizeConfig.blockSizeHorizontal * 18),
                                  child: Text(
                                    'Data Pesanan',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3),
                      child: Container(
                        width: SizeConfig.blockSizeHorizontal * 90,
                        height: SizeConfig.blockSizeVertical * 10,
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/Carousel.png',
                                width: SizeConfig.blockSizeVertical * 7,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal *
                                          15.5),
                                  child: Text(
                                    'Update Carousel',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
