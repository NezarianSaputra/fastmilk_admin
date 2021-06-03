import 'package:fastmilk_admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../size_config.dart';

class BodyEditPegawai extends StatefulWidget {
  BodyEditPegawai({Key key}) : super(key: key);

  @override
  _BodyEditPegawaiState createState() => _BodyEditPegawaiState();
}

class _BodyEditPegawaiState extends State<BodyEditPegawai> {
  Map data = {};
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController tlpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Container(
          child: Column(children: [
        Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  SvgPicture.asset('assets/images/Admin.svg'),
                  Text(
                    "a",
                    style: TextStyle(color: Color(0xFFFE931D), fontSize: 20),
                  )
                ],
              ),
            )),
        Expanded(
            flex: 0,
            child: Column(children: [
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
                        child: Text('example@mail.id',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                            overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 15,
                thickness: 1,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buildTextField(namaController, 'Nama'),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 3,
                    ),
                    _buildTextField(alamatController, 'Alamat'),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 3,
                    ),
                    _buildTextField(tlpController, 'Telepon')
                  ],
                ),
              )
            ])),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical * 1.5,
              horizontal: SizeConfig.blockSizeHorizontal * 3.5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: SizeConfig.blockSizeHorizontal * 15,
            decoration: BoxDecoration(
                color: Color(0xFFFE931D),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: MaterialButton(
              onPressed: () {
                if (!_formKey.currentState.validate()) {
                  // ScaffoldMessenger.of(context).showSnackBar(Snackbar(content: Text('Processing Data')));
                }
              },
              child: Text(
                'ACCEPT',
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
      ])),
    );
  }

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
}

// class PhoneFormField extends StatelessWidget {
//   const PhoneFormField({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: TextFormField(
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//             hintText: "Masukan nomor telepon",
//             labelText: "Phone",
//             labelStyle: TextStyle(color: Colors.black, fontSize: 20),
//             hintStyle: TextStyle(color: Colors.grey)),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return "Nomor telepon tidak boleh kosong";
//           }
//           return null;
//         },
//       ),
//     );
//   }
// }

// class AlamatFormField extends StatelessWidget {
//   const AlamatFormField({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: TextFormField(
//         decoration: InputDecoration(
//             hintText: "Masukan alamat lengkap",
//             labelText: "Alamat",
//             labelStyle: TextStyle(color: Colors.black, fontSize: 20),
//             hintStyle: TextStyle(color: Colors.grey)),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return "Alamat tidak boleh kosong";
//           }
//           return null;
//         },
//       ),
//     );
//   }
// }

// class NamaFormField extends StatelessWidget {
//   const NamaFormField({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: TextFormField(
//         decoration: InputDecoration(
//             hintText: "Masukan nama",
//             labelText: "Nama",
//             labelStyle: TextStyle(color: Colors.black, fontSize: 20),
//             hintStyle: TextStyle(color: Colors.grey)),
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return "Nama tidak boleh kosong";
//           }
//           return null;
//         },
//       ),
//     );
//   }
// }
