import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastmilk_admin/constants.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';

class BodyEditBarang extends StatefulWidget {
  @override
  _BodyEditBarangState createState() => _BodyEditBarangState();
}

class _BodyEditBarangState extends State<BodyEditBarang> {
  final _formKey = GlobalKey<FormState>();
  Map data = {};
  final jenisController = TextEditingController();
  final rasaController = TextEditingController();
  final stokController = TextEditingController();
  final beratController = TextEditingController();
  final hargaController = TextEditingController();
  final kategoriController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    jenisController.text = data['Jenis'];
    rasaController.text = data['Rasa'];
    stokController.text = data['Stok'];
    beratController.text = data['Berat'];
    hargaController.text = data['Harga'];
    kategoriController.text = data['Kategori'];

    SizeConfig().init(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeHorizontal * 1.5,
              horizontal: SizeConfig.blockSizeVertical * 3.5,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: jenisController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "Masukan nama produk",
                          labelText: "Nama Produk",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Nama produk tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: beratController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Masukan berat barang / (ml)",
                          labelText: "Berat Produk",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Berat produk tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: rasaController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Masukan varian rasa",
                          labelText: "Rasa",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Varian rasa tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: stokController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Masukan Stok produk",
                          labelText: "Stok",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Stok produk tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: kategoriController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          hintText: "Masukan kategori produk",
                          labelText: "Kategori",
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                          hintStyle: TextStyle(color: Colors.grey)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Kategori tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   child: Text(
                  //     "Upload Gambar",
                  //     style: TextStyle(fontSize: 20),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16),
                  //   child: MaterialButton(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //         side: BorderSide(
                  //           color: kPrimaryColor,
                  //           width: 1,
                  //           style: BorderStyle.solid,
                  //         )),
                  //     onPressed: () {},
                  //     child: Text(
                  //       "Upload Gambar",
                  //       style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  //     ),
                  //   ),
                  // ),
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
                            CollectionReference ref = FirebaseFirestore.instance.collection('Sales');
                            ref.doc().update({
                              'Jenis' : jenisController.text,
                              'Berat' : beratController.text,
                              'Rasa' : rasaController.text,
                              'Stok' : stokController.text,
                              'Kategori' : kategoriController.text
                            }).whenComplete(() => Navigator.of(context).pop());
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
          ),
        ),
      ),
    );
  }
}
