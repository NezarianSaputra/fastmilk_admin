import 'package:fastmilk_admin/screen/detail_barang/detail_barang.dart';
import 'package:fastmilk_admin/screen/homepage/home_page.dart';
import 'package:fastmilk_admin/screen/tambah_data/tambah_data_barang/tambah_databarang.dart';
import 'package:flutter/material.dart';
import 'component/bodyData_Barang.dart';

class DataBarang extends StatelessWidget {
  static String routeName = '/databarang';
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFFFE931D)),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            onPressed: () {
              Navigator.pushNamed(context, TambahBarang.routeName);
            },
            child: Icon(Icons.add, color: Color(0xFFFE931D)),
          ),
          appBar: AppBar(
            title: Text('DATA BARANG',
                style: TextStyle(
                    fontSize: 17, fontFamily: 'ABeeZee', color: Colors.white)),
            centerTitle: true,
            backgroundColor: Color(0xFFFE931D),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          body: BodyDataBarang()),
    );
  }
}
