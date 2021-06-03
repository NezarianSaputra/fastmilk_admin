import 'package:flutter/material.dart';

class Sales {
  final String salesId;
  final String nama;
  final String email;
  final String alamat;
  final String notelp;

  Sales({
    this.salesId,
    this.nama,
    this.email,
    this.alamat,
    this.notelp,
  });

  // Map<String, dynamic> toMap(){
  //   return {
  //     'salesId' : salesId,
  //     'Nama' : nama,
  //     'Email' : email,
  //     'Alamat': alamat,
  //     'No_telp' : notelp
  //   };
  // }

  // static Sales fromMap(Map<String, dynamic> map) {
  //   if(map == null) return null;

  //   return Sales(
  //     nama: map['Nama'],
  //     email: map['Email'],
  //     alamat: map['Alamat'],
  //     notelp: map['No_telp'],
  //     salesId: map['salesId']
  //   );
  // }
}