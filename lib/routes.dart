import 'package:fastmilk_admin/screen/data_barang/data_barang.dart';
import 'package:fastmilk_admin/screen/detail_barang/detail_barang.dart';
import 'package:fastmilk_admin/screen/detail_kurir/detail_kurir.dart';
import 'package:fastmilk_admin/screen/detail_pesanan/detail_pesanan.dart';
import 'package:fastmilk_admin/screen/edit_data/edit_barang/edit_barang.dart';
import 'package:fastmilk_admin/screen/edit_data/edit_pegawai/edit_pegawai.dart';
import 'package:fastmilk_admin/screen/homepage/home_page.dart';
import 'package:fastmilk_admin/screen/landing_screen/landing_screen.dart';
import 'package:fastmilk_admin/screen/list_pegawai/data_pegawai.dart';
import 'package:fastmilk_admin/screen/login/login.dart';
import 'package:fastmilk_admin/screen/pesanan_masuk/pesanan_masuk.dart';
import 'package:fastmilk_admin/screen/pilih_kurir/pilih_kurir.dart';
import 'package:fastmilk_admin/screen/profile_admin/profile_admin.dart';
import 'package:fastmilk_admin/screen/profile_pegawai/profile_pegawai.dart';
import 'package:fastmilk_admin/screen/splashscreen/splash_screen.dart';
import 'package:fastmilk_admin/screen/tambah_data/tambah_data_barang/tambah_databarang.dart';
import 'package:fastmilk_admin/screen/tambah_data/tambah_data_pegawai/tambah_datapegawai.dart';
import 'package:fastmilk_admin/screen/data_pesanan/data_pesanan.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  LandingScreen.routeName: (context) => LandingScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  Login.routeName: (context) => Login(),
  // ProfilePegawai.routeName: (context) => ProfilePegawai(),
  ProfilePegawai.routeName: (context) => ProfilePegawai(),
  EditPegawai.routeName: (context) => EditPegawai(),
  HomePage.routeName: (context) => HomePage(),
  DataPegawai.routeName: (context) => DataPegawai(),
  ProfileAdmin.routeName: (context) => ProfileAdmin(),
  TambahPegawai.routeName: (context) => TambahPegawai(),
  DataBarang.routeName: (context) => DataBarang(),
  TambahBarang.routeName: (context) => TambahBarang(),
  DetailBarang.routeName: (context) => DetailBarang(),
  EditBarang.routeName: (context) => EditBarang(),
  DataPesanan.routeName: (context) => DataPesanan(),
  PesananMasuk.routeName: (context) => PesananMasuk(),
  DetailPesanan.routeName: (context) => DetailPesanan(),
  PilihKurir.routeName: (context) => PilihKurir(),
  DetailKurir.routeName: (context) => DetailKurir()
};
