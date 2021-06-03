import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastmilk_admin/component/default_button.dart';
import 'package:fastmilk_admin/constants.dart';
import 'package:fastmilk_admin/screen/profile_pegawai/profile_pegawai.dart';
import 'package:fastmilk_admin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyData extends StatefulWidget {
  BodyData({Key key}) : super(key: key);

  @override
  _BodyDataState createState() => _BodyDataState();
}

class _BodyDataState extends State<BodyData> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextEditingController namaController = TextEditingController();
    TextEditingController alamatController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

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

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference sales = firebaseFirestore.collection('Sales');
    return StreamBuilder(
        stream: sales.orderBy('Nama').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                var doc = snapshot.data.docs[index];
                return ListTile(
                  leading: SvgPicture.asset('assets/images/Admin.svg'),
                  title: Text(
                    doc['Nama'],
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, ProfilePegawai.routeName,
                        arguments: {
                          'Nama': doc.data()['Nama'],
                          'Email': doc.data()['Email'],
                          'Alamat': doc.data()['Alamat'],
                          'No_telp': doc.data()['No_telp']
                        });
                  },
                  trailing:
                      // InkWell(
                      //   onTap: () {
                      //     sales.doc(doc.id).delete();
                      //   },
                      IconButton(
                    onPressed: () {
                      namaController.text = doc.data()['Nama'];
                      alamatController.text = doc.data()['Alamat'];
                      phoneController.text = doc.data()['No_telp'];

                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: SingleChildScrollView(
                                  child: Container(
                                    height: SizeConfig.blockSizeVertical * 60,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height:
                                              SizeConfig.blockSizeVertical * 3,
                                        ),
                                        Text(
                                          "Edit Data Pegawai",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        _buildTextField(namaController, 'Nama'),
                                        SizedBox(
                                          height:
                                              SizeConfig.blockSizeVertical * 3,
                                        ),
                                        _buildTextField(
                                            alamatController, 'Alamat'),
                                        SizedBox(
                                          height:
                                              SizeConfig.blockSizeVertical * 3,
                                        ),
                                        _buildTextField(
                                            phoneController, 'Telepon'),
                                        SizedBox(
                                          height:
                                              SizeConfig.blockSizeVertical * 2,
                                        ),
                                        Column(
                                          children: [
                                            DefaultButton2(
                                              text: "Simpan Data",
                                              press: () {
                                                snapshot
                                                    .data.docs[index].reference
                                                    .update({
                                                  'Nama': namaController.text,
                                                  'Alamat':
                                                      alamatController.text,
                                                  'No_telp':
                                                      phoneController.text
                                                }).whenComplete(() =>
                                                        Navigator.pop(context));
                                              },
                                            ),
                                            SizedBox(
                                              height:
                                                  SizeConfig.blockSizeVertical *
                                                      1,
                                            ),
                                            DefaultButton2(
                                              text: "Hapus",
                                              press: () {
                                                snapshot
                                                    .data.docs[index].reference
                                                    .delete();
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                    },
                    icon: Icon(Icons.edit),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
            );
          }
        });
  }
}
