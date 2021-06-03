import 'package:fastmilk_admin/screen/edit_data/edit_barang/component/body_editbarang.dart';
import 'package:flutter/material.dart';

class EditBarang extends StatelessWidget {
  static String routeName = '/editbarang';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text('EDIT BARANG',
            style: TextStyle(fontSize: 17, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xFFFE931D),
      ),
      body: BodyEditBarang(),
    );
  }
}
