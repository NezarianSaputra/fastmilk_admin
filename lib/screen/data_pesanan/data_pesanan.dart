import 'package:fastmilk_admin/screen/data_pesanan/component/body_dataPesanan.dart';
import 'package:fastmilk_admin/screen/homepage/home_page.dart';
import 'package:flutter/material.dart';

class DataPesanan extends StatelessWidget {
  static String routeName = '/datapesanan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'DATA PESANAN',
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFE931D),
      ),
      body: BodyDataPesanan(),
    );
  }
}
