import 'package:fastmilk_admin/screen/detail_kurir/component/body_detailKurir.dart';
import 'package:fastmilk_admin/screen/pilih_kurir/pilih_kurir.dart';
import 'package:flutter/material.dart';

class DetailKurir extends StatelessWidget {
  static String routeName = '/detailkurir';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed(PilihKurir.routeName);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'PILIH KURIR',
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFE931D),
      ),
      body: BodyDetailKurir(),
    );
  }
}
