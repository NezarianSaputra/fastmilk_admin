import 'package:fastmilk_admin/screen/data_barang/data_barang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class BodyDetailBarang extends StatefulWidget {
  BodyDetailBarang({Key key}) : super(key: key);

  @override
  _BodyProfilePegawaiState createState() => _BodyProfilePegawaiState();
}

class _BodyProfilePegawaiState extends State<BodyDetailBarang> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Expanded(
                flex: 0,
                child: Container(
                    child: Image.asset(
                  'assets/images/yoghurt.jpg',
                  fit: BoxFit.cover,
                ))),
            Expanded(
              flex: 0,
              child: Column(
                children: [
                  Divider(
                    color: Colors.grey,
                    height: 15,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 1.5,
                        horizontal: SizeConfig.blockSizeHorizontal * 3.5),
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text('ID Produk',
                                style: TextStyle(fontSize: 18))),
                        Container(
                            width: 15,
                            child: Text(':', style: TextStyle(fontSize: 18))),
                        Flexible(
                            child: Text(
                                data['Produk_id'],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                                overflow: TextOverflow.fade)),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 15,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 1.5,
                        horizontal: SizeConfig.blockSizeHorizontal * 3.5),
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text('Nama Produk',
                                style: TextStyle(fontSize: 18))),
                        Container(
                            width: 15,
                            child: Text(':', style: TextStyle(fontSize: 18))),
                        Flexible(
                            child: Text(data['Jenis'],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                                overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 15,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 1.5,
                        horizontal: SizeConfig.blockSizeHorizontal * 3.5),
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text('Berat Produk',
                                style: TextStyle(fontSize: 18))),
                        Container(
                            width: 15,
                            child: Text(':', style: TextStyle(fontSize: 18))),
                        Flexible(
                            child: Text(data['Berat'],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                                overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 15,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 1.5,
                        horizontal: SizeConfig.blockSizeHorizontal * 3.5),
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text('Rasa Produk',
                                style: TextStyle(fontSize: 18))),
                        Container(
                            width: 15,
                            child: Text(':', style: TextStyle(fontSize: 18))),
                        Flexible(
                            child: Text(data['Rasa'],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                                overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 15,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 1.5,
                        horizontal: SizeConfig.blockSizeHorizontal * 3.5),
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text('Stok Produk',
                                style: TextStyle(fontSize: 18))),
                        Container(
                            width: 15,
                            child: Text(':', style: TextStyle(fontSize: 18))),
                        Flexible(
                            child: Text(data['Stok'] + " Pcs",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                                overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 15,
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 1.5,
                        horizontal: SizeConfig.blockSizeHorizontal * 3.5),
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text('Kategori',
                                style: TextStyle(fontSize: 18))),
                        Container(
                            width: 15,
                            child: Text(':', style: TextStyle(fontSize: 18))),
                        Flexible(
                            child: Text(data['Kategori'],
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                                overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 15,
                    thickness: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                    color: Color(0xFFFE931D),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(DataBarang.routeName);
                  },
                  child: Text(
                    'KEMBALI',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color(0xFFFE931D),
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
