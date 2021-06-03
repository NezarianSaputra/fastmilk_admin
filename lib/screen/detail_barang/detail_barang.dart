import 'package:fastmilk_admin/screen/data_barang/data_barang.dart';
import 'package:fastmilk_admin/screen/detail_barang/component/body_detailbarang.dart';
import 'package:flutter/material.dart';

class DetailBarang extends StatelessWidget {
  static String routeName = '/detailbarang';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(DataBarang.routeName);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text(
            'DETAIL BARANG',
            style: TextStyle(fontSize: 17, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFFE931D),
        ),
      body: BodyDetailBarang(),
    );
  }
}
