import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastmilk_admin/core/Models/Sales.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class FirestoreService {
  final CollectionReference _salescollectionReference = FirebaseFirestore.instance.collection('Sales');
  final CollectionReference _produkcollectionReference = FirebaseFirestore.instance.collection('Produk');
  final String uid;

  FirestoreService({this.uid});

  Future tambahDataProduk(String image, String jenis, String rasa, String stok, String harga, String berat, String kategori) async {
    return await _produkcollectionReference.add({
      'Image' : image,
      'Jenis' : jenis,
      'Rasa' : rasa,
      'Stok' : stok,
      'Harga' : harga,
      'Berat' : berat,
      'Kategori' : kategori
    });
  }

  Future addSales(String salesId, String nama, String email, String alamat, String notelp) async {
    await _salescollectionReference.add({
      'salesId' : salesId,
      'Nama' : nama, 
      'Email' : email,
      'Alamat' : alamat,
      'No_telp' : notelp
    });
  }


}