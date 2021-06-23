import 'package:fastmilk_admin/screen/detail_pesanan/component/body_detailPesanan.dart';
import 'package:fastmilk_admin/screen/pesanan_masuk/pesanan_masuk.dart';
import 'package:flutter/material.dart';

class DetailPesanan extends StatelessWidget {
  static String routeName = '/detailpesanan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'PESANAN MASUK',
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFE931D),
      ),
      body: BodyDetailPesanan(),
    );
  }
}
