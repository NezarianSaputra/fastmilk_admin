import 'package:flutter/material.dart';

class SalesProvider with ChangeNotifier {
  String _nama;
  String _email;
  String _alamat;
  String _notelp;
  String _salesId;

  // Geters
  String get nama => _nama;
  String get email => _email;
  String get alamat => _alamat;
  String get notelp => _notelp;

  // Setters
  changeName(String value) {
    _nama = value;
    notifyListeners();
  }
  changeEmail(String value) {
    _email = value;
    notifyListeners();
  }
  changeAlamat(String value) {
    _alamat = value;
    notifyListeners();
  }
  changeNotelp(String value) {
    _notelp = value;
    notifyListeners();
  }

  saveDataSales(){ 
    print("$nama, $email, $alamat, $notelp");
  }
}