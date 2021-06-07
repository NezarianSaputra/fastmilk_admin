import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class BodyDetailKurir extends StatefulWidget {
  @override
  _BodyDetailKurirState createState() => _BodyDetailKurirState();
}

class _BodyDetailKurirState extends State<BodyDetailKurir> {
  void _showSimpleDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: SizeConfig.blockSizeHorizontal * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/Ceklis.png",
                          width: SizeConfig.blockSizeHorizontal * 40,
                          height: SizeConfig.blockSizeVertical * 20,
                        ),
                        Text(
                          "Detail pesanan",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "ABeeZee",
                          ),
                        ),
                        Text(
                          "berhasil dikirim ke kurir",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: "ABeeZee",
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical * 10,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 2),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/Admin.svg'),
                    Text(
                      "Miwpaw Ganteng",
                      style: TextStyle(color: Color(0xFFFE931D), fontSize: 20),
                    )
                  ],
                ),
              )),
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
                          child: Text('Email', style: TextStyle(fontSize: 18))),
                      Container(
                          width: 15,
                          child: Text(':', style: TextStyle(fontSize: 18))),
                      Flexible(
                          child: Text("miwpaw123@gmail.com",
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
                          child: Text('Nama', style: TextStyle(fontSize: 18))),
                      Container(
                          width: 15,
                          child: Text(':', style: TextStyle(fontSize: 18))),
                      Flexible(
                          child: Text("Miwpaw Ganteng",
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
                          child:
                              Text('Alamat', style: TextStyle(fontSize: 18))),
                      Container(
                          width: 15,
                          child: Text(':', style: TextStyle(fontSize: 18))),
                      Flexible(
                          child: Text("Jl.Pros Diamond No.182",
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
                          child: Text('No.Telepon',
                              style: TextStyle(fontSize: 18))),
                      Container(
                          width: 15,
                          child: Text(':', style: TextStyle(fontSize: 18))),
                      Flexible(
                          child: Text("085156942363",
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
                Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 80,
                    height: SizeConfig.blockSizeVertical * 7,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: kPrimaryColor,
                      onPressed: () {
                        _showSimpleDialog(context);
                      },
                      child: Text(
                        "Kirim detail pesanan",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
