import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastmilk_admin/screen/detail_kurir/detail_kurir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class BodyPilihKurir extends StatefulWidget {
  @override
  _BodyPilihKurirState createState() => _BodyPilihKurirState();
}

class _BodyPilihKurirState extends State<BodyPilihKurir> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference sales = firebaseFirestore.collection('Sales');
    return StreamBuilder(
        stream: sales.orderBy('Nama').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: ListView.separated(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  var doc = snapshot.data.docs[index];
                  return ListTile(
                    leading: SvgPicture.asset('assets/images/Admin.svg'),
                    title: Text(doc['Nama']),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: kPrimaryColor,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(DetailKurir.routeName, arguments: {
                        'Nama': doc.data()['Nama'],
                        'Email': doc.data()['Email'],
                        'Alamat': doc.data()['Alamat'],
                        'No_telp': doc.data()['No_telp']
                      });
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.grey,
                    thickness: 1,
                  );
                },
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
