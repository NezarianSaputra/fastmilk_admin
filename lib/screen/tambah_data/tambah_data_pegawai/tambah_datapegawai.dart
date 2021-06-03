import 'package:fastmilk_admin/screen/tambah_data/tambah_data_pegawai/component/body_tambahpegawai.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'component/body_tambahpegawai.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(TambahPegawai());
// }

class TambahPegawai extends StatelessWidget {
  static String routeName = "/tambahPegawai";
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
          'TAMBAH DATA PEGAWAI',
          style: TextStyle(fontSize: 17, color:  Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFE931D),
      ),
      body: BodyTambahDataPegawai(),
    );
  }
}
