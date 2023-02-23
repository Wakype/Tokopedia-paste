// ignore_for_file: unnecessary_overrides, unused_import, avoid_print, prefer_const_constructors, unused_local_variable, unused_catch_clause, non_constant_identifier_names


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';

class CreateProdukController extends GetxController {
  // final aktifasi = true.obs;
  // var gambar = false.obs;
  // changeActivation() => aktifasi.toggle();

  TextEditingController beratProduk = TextEditingController();
  TextEditingController daerahProduk = TextEditingController();
  TextEditingController deskProduk = TextEditingController();
  TextEditingController gambarProduk = TextEditingController();
  TextEditingController hargaProduk = TextEditingController();
  TextEditingController namaProduk = TextEditingController();
  TextEditingController namaToko = TextEditingController();
  TextEditingController etalaseProduk = TextEditingController();

  uploadGambar() async {
    String data = await ProdukController().addProdukPhoto();
    gambarProduk.text = data;
    // gambar = true;
    print(data);
  }


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
