import 'package:fastmilk_admin/screen/tambah_data/tambah_data_barang/component/body_tambahbarang.dart';
import 'package:flutter/material.dart';

class TambahBarang extends StatelessWidget {
  static String routeName = "/tambahBarang";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'TAMBAH DATA BARANG',
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFE931D),
      ),
      body: BodyTambahBarang(),
    );
  }
}
