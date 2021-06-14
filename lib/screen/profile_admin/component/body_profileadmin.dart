import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastmilk_admin/component/default_button.dart';
import 'package:fastmilk_admin/constants.dart';
import 'package:fastmilk_admin/screen/login/login.dart';
import 'package:fastmilk_admin/services/auth_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';

class BodyProfileAdmin extends StatefulWidget {
  @override
  _BodyProfileAdminState createState() => _BodyProfileAdminState();
}

class _BodyProfileAdminState extends State<BodyProfileAdmin> {
  // signOut() async {
  //   await auth.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final uid = user.uid;

    SizeConfig().init(context);
    return StreamBuilder(
        stream:
            // Provider.of(context).read<AuthServices>().readData(),
            FirebaseFirestore.instance
                .collection('Admin')
                .doc(uid)
                // .where('Id_Admin', isEqualTo: uid)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Column(
                children: [
                  Expanded(
                      flex: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockSizeVertical * 2),
                        child: Image.asset('assets/images/admin_profile.png'),
                      )),
                  Expanded(
                    flex: 0,
                    child: Column(
                      children: [
                        Divider(
                          color: Colors.grey,
                          height: 15,
                          thickness: 1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 1.5,
                              horizontal: SizeConfig.blockSizeHorizontal * 3.5),
                          child: Row(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text('Email',
                                      style: TextStyle(fontSize: 18))),
                              Container(
                                  width: 15,
                                  child: Text(':',
                                      style: TextStyle(fontSize: 18))),
                              Flexible(
                                  child: Text(
                                      snapshot.data
                                          .data()['Email_Admin']
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                      overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 15,
                          thickness: 1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 1.5,
                              horizontal: SizeConfig.blockSizeHorizontal * 3.5),
                          child: Row(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text('Nama',
                                      style: TextStyle(fontSize: 18))),
                              Container(
                                  width: 15,
                                  child: Text(':',
                                      style: TextStyle(fontSize: 18))),
                              Flexible(
                                  child: Text(
                                      snapshot.data
                                          .data()['Nama_Admin']
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                      overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 15,
                          thickness: 1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 1.5,
                              horizontal: SizeConfig.blockSizeHorizontal * 3.5),
                          child: Row(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text('Alamat',
                                      style: TextStyle(fontSize: 18))),
                              Container(
                                  width: 15,
                                  child: Text(':',
                                      style: TextStyle(fontSize: 18))),
                              Flexible(
                                  child: Text(
                                      snapshot.data.data()['Alamat'].toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                      overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 15,
                          thickness: 1,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 1.5,
                              horizontal: SizeConfig.blockSizeHorizontal * 3.5),
                          child: Row(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text('No.Telepon',
                                      style: TextStyle(fontSize: 18))),
                              Container(
                                  width: 15,
                                  child: Text(':',
                                      style: TextStyle(fontSize: 18))),
                              Flexible(
                                  child: Text(
                                      snapshot.data
                                          .data()['No_Telepon']
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                      overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 15,
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  DefaultButton2(
                    text: "Logout",
                    press: () {
                      // signOut();
                      context.read<AuthServices>().signOut();
                      Navigator.pushNamed(context, Login.routeName);
                    },
                  )
                ],
              ),
            );
          } else {
            return Text('Loading...');
          }
        });
  }
}
