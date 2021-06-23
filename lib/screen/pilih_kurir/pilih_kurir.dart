import 'package:fastmilk_admin/screen/detail_pesanan/detail_pesanan.dart';
import 'package:fastmilk_admin/screen/pilih_kurir/component/body_pilihKurir.dart';
import 'package:flutter/material.dart';

class PilihKurir extends StatelessWidget {
  static String routeName = '/pilihkurir';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'PILIH KURIR',
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFE931D),
      ),
      body: BodyPilihKurir(),
    );
  }
}
