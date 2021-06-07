import 'package:fastmilk_admin/screen/data_pesanan/data_pesanan.dart';
import 'package:fastmilk_admin/screen/pesanan_masuk/component/body_PesananMasuk.dart';
import 'package:flutter/material.dart';

class PesananMasuk extends StatelessWidget {
  static String routeName = '/pesananmasuk';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed(DataPesanan.routeName);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'PESANAN MASUK',
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFE931D),
      ),
      body: BodyPesananMasuk(),
    );
  }
}
