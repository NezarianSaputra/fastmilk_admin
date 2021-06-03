import 'package:flutter/material.dart';

import 'components/body_editpegawai.dart';

// void main() => runApp(EditPegawai());

class EditPegawai extends StatelessWidget {
  static String routeName = "/editPegawai";
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
          title: Text('EDIT PEGAWAI',
              style: TextStyle(fontSize: 17, color: Colors.white)),
          centerTitle: true,
          backgroundColor: Color(0xFFFE931D),
        ),
        body: BodyEditPegawai());
  }
}
