import 'package:fastmilk_admin/screen/detail_kurir/detail_kurir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class BodyPilihKurir extends StatefulWidget {
  @override
  _BodyPilihKurirState createState() => _BodyPilihKurirState();
}

class _BodyPilihKurirState extends State<BodyPilihKurir> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SvgPicture.asset('assets/images/Admin.svg'),
            title: Text('Miwpaw Ganteng'),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryColor,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(DetailKurir.routeName);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey,
            thickness: 1,
          );
        },
      ),
    );
  }
}
