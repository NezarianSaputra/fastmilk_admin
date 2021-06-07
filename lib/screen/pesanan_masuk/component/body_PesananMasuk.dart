import 'package:fastmilk_admin/constants.dart';
import 'package:fastmilk_admin/screen/detail_pesanan/detail_pesanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyPesananMasuk extends StatefulWidget {
  @override
  _BodyPesananMasukState createState() => _BodyPesananMasukState();
}

class _BodyPesananMasukState extends State<BodyPesananMasuk> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListTile(
          leading: SvgPicture.asset('assets/images/Admin.svg'),
          title: Text('Budi'),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: kPrimaryColor,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(DetailPesanan.routeName);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
          thickness: 1,
        );
      },
    ));
  }
}
