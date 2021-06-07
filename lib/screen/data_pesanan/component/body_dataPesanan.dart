import 'package:fastmilk_admin/screen/pesanan_masuk/pesanan_masuk.dart';
import 'package:fastmilk_admin/size_config.dart';
import 'package:flutter/material.dart';

class BodyDataPesanan extends StatefulWidget {
  @override
  _BodyDataPesananState createState() => _BodyDataPesananState();
}

class _BodyDataPesananState extends State<BodyDataPesanan> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 5),
              child: Container(
                width: SizeConfig.blockSizeHorizontal * 90,
                height: SizeConfig.blockSizeVertical * 10,
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  onPressed: () {
                    Navigator.pushNamed(context, PesananMasuk.routeName);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/New.png',
                        width: SizeConfig.blockSizeVertical * 7,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 18),
                          child: Text(
                            'Pesanan Masuk',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
              child: Container(
                width: SizeConfig.blockSizeHorizontal * 90,
                height: SizeConfig.blockSizeVertical * 10,
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  borderSide: BorderSide(width: 1, color: Colors.grey),
                  onPressed: () {
                    // Navigator.pushNamed(context, DataPegawai.routeName);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/Peringatan.png',
                        width: SizeConfig.blockSizeVertical * 7,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.blockSizeHorizontal * 18),
                          child: Text(
                            'Status Pesanan',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
