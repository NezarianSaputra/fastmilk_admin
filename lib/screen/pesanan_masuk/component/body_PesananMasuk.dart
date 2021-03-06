import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastmilk_admin/constants.dart';
import 'package:fastmilk_admin/screen/detail_pesanan/detail_pesanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyPesananMasuk extends StatefulWidget {
  @override
  _BodyPesananMasukState createState() => _BodyPesananMasukState();
}

class _BodyPesananMasukState extends State<BodyPesananMasuk> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference pesanan = firebaseFirestore.collection('Pesanan');
    CollectionReference pelanggan = firebaseFirestore.collection('Pelanggan');

    return StreamBuilder(
        stream: pesanan.orderBy('Tanggal_Pesanan').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                var doc = snapshot.data.docs[index];
                final String id_pelanggan = doc['Id_Pelanggan'];
                return ListTile(
                  leading: SvgPicture.asset('assets/images/Admin.svg'),

                  title: Text(doc['Id_Pelanggan']),
                  // StreamBuilder(
                  //     stream: pelanggan
                  //         .doc('00pViYlt1BFq9RbW6qr4')
                  //         // .where(pelanggan.id, isEqualTo: id_pelanggan)
                  //         .snapshots(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         return Text(
                  //           snapshot.data.data()['namaLengkap'].toString(),
                  //         );
                  //       } else {
                  //         return Text('Loading..');e\]]]]]]]]]]\
                  //       }
                  //     }),
                  trailing: (status == true)
                      ? Icon(
                          Icons.arrow_forward_ios,
                          color: kPrimaryColor,
                        )
                      : Icon(
                          Icons.done,
                          color: kPrimaryColor,
                        ),

                  // selected: status,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(DetailPesanan.routeName, arguments: {
                      'Id_Order': doc.data()['Produk_id'],
                      'Id_Pelanggan': doc.data()['Id_Pelanggan'],
                      'Id_Produk': doc.data()['Id_Produk'],
                      'Jumlah_Pesanan': doc.data()['Jumlah_Pesanan'],
                      'Lokasi_Pengiriman_Pesanan':
                          doc.data()['Lokasi_Pengiriman_Pesanan'],
                      'Status_Pesanan': doc.data()['Status_Pesanan'],
                      'Tanggal_Pesanan': doc.data()['Tanggal_Pesanan'],
                    });
                    setState(() {
                      status = false;
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
            );
          }
        });
  }
}
