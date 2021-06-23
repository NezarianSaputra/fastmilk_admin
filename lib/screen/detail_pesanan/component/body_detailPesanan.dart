import 'package:fastmilk_admin/constants.dart';
import 'package:fastmilk_admin/screen/pilih_kurir/pilih_kurir.dart';
import 'package:fastmilk_admin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyDetailPesanan extends StatefulWidget {
  @override
  _BodyDetailPesananState createState() => _BodyDetailPesananState();
}

class _BodyDetailPesananState extends State<BodyDetailPesanan> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.blockSizeHorizontal * 100,
      height: SizeConfig.blockSizeVertical * 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
            child: SvgPicture.asset('assets/images/Admin.svg'),
          ),
          Text(
            data['Id_Pelanggan'],
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontFamily: 'ABeeZee'),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 85,
              height: SizeConfig.blockSizeVertical * 40,
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor, width: 3),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3),
                      child: Container(
                          child: Row(
                        children: [
                          Text("Tanggal"),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 19,
                          ),
                          Text(":"),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 2,
                          ),
                          Text(data['Tanggal_Pesanan'])
                        ],
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3),
                      child: Container(
                          child: Row(
                        children: [
                          Text("Opsi pembayaran"),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 1,
                          ),
                          Text(":"),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 2,
                          ),
                          Text("Transfer bank")
                        ],
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3),
                      child: Container(
                          child: Row(
                        children: [
                          Text("Alamat"),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 19.5,
                          ),
                          Text(":"),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data['Lokasi_Pengiriman_Pesanan']),
                            ],
                          )
                        ],
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3),
                      child: Container(
                          child: Row(
                        children: [
                          Text("Pesanan"),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 18,
                          ),
                          Text(":"),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text(data['Id_Produk'])],
                          )
                        ],
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 3),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.blockSizeVertical * 3),
                      child: Container(
                          child: Row(
                        children: [
                          Text("Total harga"),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 12,
                          ),
                          Text(":"),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 2,
                          ),
                          Text("Rp. 1500")
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 3),
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 80,
              height: SizeConfig.blockSizeVertical * 7,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PilihKurir();
                  }));
                },
                child: Text(
                  "Terima Pesanan",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 1),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal * 9),
              child: Container(
                width: SizeConfig.blockSizeHorizontal * 80,
                height: SizeConfig.blockSizeVertical * 7,
                child: OutlineButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  borderSide: BorderSide(color: kPrimaryColor),
                  child: Text(
                    "Tolak Pesanan",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: kPrimaryColor),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
