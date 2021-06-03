import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastmilk_admin/core/services/firestore_service.dart';
import 'package:fastmilk_admin/screen/data_barang/data_barang.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class BodyTambahBarang extends StatefulWidget {
  BodyTambahBarang({Key key}) : super(key: key);
  @override
  _BodyTambahBarangState createState() => _BodyTambahBarangState();
}

class _BodyTambahBarangState extends State<BodyTambahBarang> {
  String imagePath;
  final _formKey = GlobalKey<FormState>();

  final jenisController = TextEditingController();
  final rasaController = TextEditingController();
  final stokController = TextEditingController();
  final beratController = TextEditingController();
  final hargaController = TextEditingController();
  final kategoriController = TextEditingController();
  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference produk = firestore.collection('Produk');

    var uuid = Uuid();
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: jenisController,
                        decoration: InputDecoration(
                            hintText: "Masukan Nama Produk",
                            labelText: "Nama Produk",
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Jenis produk tidak boleh kosong";
                          }
                          return null;
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: beratController,
                      decoration: InputDecoration(
                          hintText: "Beri keterangan berat produk",
                          labelText: "Berat Produk",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 18),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Berat produk tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: rasaController,
                        decoration: InputDecoration(
                            hintText: "Beri keterangan rasa produk",
                            labelText: "Rasa Produk",
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Rasa produk tidak boleh kosong";
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: stokController,
                        decoration: InputDecoration(
                            hintText: "Masukan jumlah stok produk",
                            labelText: "Stok Produk",
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Stok produk tidak boleh kosong";
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: kategoriController,
                        decoration: InputDecoration(
                            hintText: "Beri keterangan kategori produk",
                            labelText: "Kategori",
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Kategori produk tidak boleh kosong";
                          }
                          return null;
                        },
                      )),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             top: SizeConfig.blockSizeVertical * 2),
                  //         child: Text(
                  //           "Upload Gambar Produk",
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 18,
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             top: SizeConfig.blockSizeVertical * 2),
                  //         child: Container(
                  //           width: SizeConfig.blockSizeHorizontal * 40,
                  //           height: SizeConfig.blockSizeVertical * 7,
                  //           child: MaterialButton(
                  //             onPressed: () async {
                  //               // File file = await getImage();
                  //               // imagePath = await FirestoreService.uploadImage(file);
                  //               // setState(() {});
                  //             },
                  //             child: Text('Upload Image',
                  //                 style: TextStyle(
                  //                     color: kPrimaryColor, fontSize: 16)),
                  //             shape: RoundedRectangleBorder(
                  //                 side: BorderSide(
                  //                     color: kPrimaryColor,
                  //                     width: 1,
                  //                     style: BorderStyle.solid),
                  //                 borderRadius: BorderRadius.circular(15)),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
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
                  produk.add({
                    'Produk_id': uuid.v1(),
                    'Jenis': jenisController.text,
                    'Rasa': rasaController.text,
                    'Stok': stokController.text,
                    'Berat': beratController.text,
                    'Harga' : hargaController.text,
                    'Kategori' : kategoriController.text
                  });
                  jenisController.text = '';
                  rasaController.text = '';
                  stokController.text = '';
                  beratController.text = '';
                  hargaController.text = '';
                  kategoriController.text = '';
                  
                  // _db.addSales(uuid.v1(), namaController.text, emailController.text, alamatController.text, phoneController.text);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataBarang(),
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
          ],
        ),
      ),
    );
  }
}

// ignore: missing_return
// Future<File> getImage() async {
//   var image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
// }
