import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastmilk_admin/component/default_button.dart';
import 'package:fastmilk_admin/screen/detail_barang/detail_barang.dart';
import 'package:fastmilk_admin/screen/edit_data/edit_barang/edit_barang.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class BodyDataBarang extends StatefulWidget {
  @override
  _BodyDataBarangState createState() => _BodyDataBarangState();
}

class _BodyDataBarangState extends State<BodyDataBarang> {
  final jenisController = TextEditingController();
  final rasaController = TextEditingController();
  final stokController = TextEditingController();
  final beratController = TextEditingController();
  final hargaController = TextEditingController();
  final kategoriController = TextEditingController();
  final imageController = TextEditingController();

  _buildTextField(TextEditingController controller, String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference produk = firebaseFirestore.collection('Produk');
    return StreamBuilder(
        stream: produk.orderBy('Jenis').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data.docs[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                        DetailBarang.routeName,
                        arguments: {
                          'Produk_id': doc.data()['Produk_id'],
                          'Jenis': doc.data()['Jenis'],
                          'Rasa': doc.data()['Rasa'],
                          'Stok': doc.data()['Stok'],
                          'Harga': doc.data()['Harga'],
                          'Berat': doc.data()['Berat'],
                          'Kategori': doc.data()['Kategori'],
                        });
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('assets/images/yoghurt.jpg',
                                fit: BoxFit.fitWidth)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: InkWell(
                                    onTap: () {
                                      jenisController.text =
                                          doc.data()['Jenis'];
                                      rasaController.text = doc.data()['Rasa'];
                                      stokController.text = doc.data()['Stok'];
                                      beratController.text =
                                          doc.data()['Berat'];
                                      hargaController.text =
                                          doc.data()['Harga'];
                                      kategoriController.text =
                                          doc.data()['Kategori'];
                                      showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                                child: SingleChildScrollView(
                                                  child: Container(
                                                    height: SizeConfig
                                                            .blockSizeVertical *
                                                        80,
                                                    child: Column(
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: SizeConfig
                                                                  .blockSizeVertical *
                                                              3,
                                                        ),
                                                        Text(
                                                          "Edit Data Produk",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        _buildTextField(
                                                            jenisController,
                                                            'Jenis'),
                                                        SizedBox(
                                                          height: SizeConfig
                                                                  .blockSizeVertical *
                                                              3,
                                                        ),
                                                        _buildTextField(
                                                            beratController,
                                                            'Berat'),
                                                        SizedBox(
                                                          height: SizeConfig
                                                                  .blockSizeVertical *
                                                              3,
                                                        ),
                                                        _buildTextField(
                                                            rasaController,
                                                            'Rasa'),
                                                        SizedBox(
                                                          height: SizeConfig
                                                                  .blockSizeVertical *
                                                              2,
                                                        ),
                                                        _buildTextField(
                                                            stokController,
                                                            'Stok'),
                                                        SizedBox(
                                                          height: SizeConfig
                                                                  .blockSizeVertical *
                                                              2,
                                                        ),
                                                        _buildTextField(
                                                            kategoriController,
                                                            'Kategori'),
                                                        SizedBox(
                                                          height: SizeConfig
                                                                  .blockSizeVertical *
                                                              2,
                                                        ),
                                                        DefaultButton2(
                                                          text: 'SIMPAN',
                                                          press: () {
                                                            snapshot
                                                                .data
                                                                .docs[index]
                                                                .reference
                                                                .update({
                                                              'Jenis':
                                                                  jenisController
                                                                      .text,
                                                              'Rasa':
                                                                  rasaController
                                                                      .text,
                                                              'Stok':
                                                                  stokController
                                                                      .text,
                                                              'Berat':
                                                                  beratController
                                                                      .text,
                                                              'Harga':
                                                                  hargaController
                                                                      .text,
                                                              'Kategori':
                                                                  kategoriController
                                                                      .text
                                                            }).whenComplete(() =>
                                                                    Navigator.pop(
                                                                        context));
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ));
                                    },
                                    child: Icon(Icons.edit,
                                        color: Colors.blueAccent)),
                              ),
                              InkWell(
                                  onTap: () {
                                    // produk.doc(doc.id).delete();
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: SizeConfig
                                                          .blockSizeVertical *
                                                      15,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Konfirmasi',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                          'Yakin ingin menghapus data?'),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          TextButton(
                                                            onPressed: () {
                                                              produk
                                                                  .doc(doc.id)
                                                                  .delete();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              'Ya',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child:
                                                                Text('Tidak'),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ));
                                  },
                                  child: Icon(Icons.delete_outline,
                                      color: Colors.red)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  doc['Jenis'],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        });
  }
}
