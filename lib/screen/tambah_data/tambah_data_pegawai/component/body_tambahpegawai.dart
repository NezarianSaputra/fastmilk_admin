import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastmilk_admin/core/Models/Sales.dart';
import 'package:fastmilk_admin/core/Services/Firestore_service.dart';
import 'package:fastmilk_admin/screen/list_pegawai/data_pegawai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uuid/uuid.dart';
import 'package:fastmilk_admin/size_config.dart';

class BodyTambahDataPegawai extends StatefulWidget {
  BodyTambahDataPegawai({Key key}) : super(key: key);

  @override
  _BodyTambahDataPegawaiState createState() => _BodyTambahDataPegawaiState();
}

class _BodyTambahDataPegawaiState extends State<BodyTambahDataPegawai> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final alamatController = TextEditingController();
  final phoneController = TextEditingController();

  String validateEmail(String value) {
    if (!value.contains('@')) {
      //JIKA VALUE MENGANDUNG KARAKTER @
      return 'Email tidak valid'; //MAKA PESAN DITAMPILKAN
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference sales = firestore.collection('Sales');

    // FirestoreService _db;

    var uuid = Uuid();
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Container(
          child: Column(children: [
        Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  SvgPicture.asset('assets/images/Admin.svg'),
                ],
              ),
            )),
        Expanded(
            flex: 0,
            child: Column(children: [
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: namaController,
                        decoration: InputDecoration(
                            hintText: "Masukan nama",
                            labelText: "Nama",
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 20),
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Masukan email",
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              hintStyle: TextStyle(color: Colors.grey)),
                          validator: validateEmail),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: alamatController,
                        decoration: InputDecoration(
                            hintText: "Masukan alamat lengkap",
                            labelText: "Alamat",
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 20),
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Alamat tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Masukan nomor telepon",
                            labelText: "Phone",
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 20),
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nomor telepon tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                ),
              )
            ])),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical * 1.5,
              horizontal: SizeConfig.blockSizeHorizontal * 3.5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xFFFE931D),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: MaterialButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // ScaffoldMessenger.of(context).showSnackBar(Snackbar(content: Text('Processing Data')));
                  sales.add({
                    'Sales_id': uuid.v1(),
                    'Nama': namaController.text,
                    'Email': emailController.text,
                    'Alamat': alamatController.text,
                    'No_telp': phoneController.text
                  });
                  namaController.text = '';
                  emailController.text = '';
                  alamatController.text = '';
                  phoneController.text = '';
                  
                  // _db.addSales(uuid.v1(), namaController.text, emailController.text, alamatController.text, phoneController.text);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataPegawai(),
                      ));
                }
              },
              child: Text(
                'SIMPAN',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color(0xFFFE931D),
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        )
      ])),
    );
  }
}
