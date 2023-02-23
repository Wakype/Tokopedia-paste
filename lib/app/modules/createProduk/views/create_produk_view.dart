// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/create_produk_controller.dart';

class CreateProdukView extends GetView<CreateProdukController> {
  final controller = Get.put(CreateProdukController());
  final produkC = Get.put(ProdukController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  width: lebar,
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [bgLogin, bgHeader]),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
                  child: Center(
                    child: Text(
                      "✨ Create Slider ✨",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Column(
                    children: [
                      Container(),
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                        margin: EdgeInsets.only(bottom: 40),
                        child: InkWell(
                          onTap: () => controller.uploadGambar(),
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: bgHeader),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Upload Gambar',
                                  style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomInput(controller: controller.gambarProduk, label: 'Link gambar Produk', hint: 'Masukkan gambar', obscure: false),
                      CustomInput(controller: controller.namaProduk, label: 'Nama Produk', hint: 'Masukkan Nama Produk', obscure: false),
                      CustomInput(controller: controller.deskProduk, label: 'Deskripsi Produk', hint: 'Masukkan Deskripsi Produk', obscure: false),
                      CustomInput(controller: controller.hargaProduk, label: 'Harga Produk', hint: 'Masukkan Harga Produk', obscure: false),
                      CustomInput(controller: controller.beratProduk, label: 'Berat Produk', hint: 'Masukkan Berat Produk', obscure: false),
                      CustomInput(controller: controller.daerahProduk, label: 'Daerah Produk', hint: 'Masukkan Daerah Produk', obscure: false),
                      CustomInput(controller: controller.etalaseProduk, label: 'Etalase Produk', hint: 'Masukkan Etalase Produk', obscure: false),
                      CustomInput(controller: controller.namaToko, label: 'Nama Toko', hint: 'Masukkan Nama Toko', obscure: false),
                    ],
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                margin: EdgeInsets.only(top: 40),
                child: InkWell(
                  onTap: () {
                    produkC.addProdukData(
                        int.parse(controller.beratProduk.text),
                        controller.daerahProduk.text,
                        controller.deskProduk.text,
                        int.parse('50'),
                        controller.etalaseProduk.text,
                        controller.gambarProduk.text,
                        int.parse(controller.hargaProduk.text),
                        true,
                        controller.namaProduk.text,
                        controller.namaToko.text,
                        int.parse("4"),
                        int.parse("200"),
                        int.parse("500"));
                  },
                  child: Container(
                    width: lebar,
                    height: 55,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: bgHeader),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Buat Slider',
                          style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

Widget CustomInput({label, controller, obscure, hint, icon}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                color: Colors.black,
                fontSize: 19,
              ),
              hintText: hint,
              hintStyle: TextStyle(fontFamily: "Poppins", color: abuAbu, fontSize: 16, fontWeight: FontWeight.w400),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              suffixIcon: icon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: abuAbu, width: 1),
                gapPadding: 5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(color: Color.fromARGB(255, 27, 27, 27), width: 1),
                gapPadding: 5,
              ),
            )),
      ),
    ],
  );
}
