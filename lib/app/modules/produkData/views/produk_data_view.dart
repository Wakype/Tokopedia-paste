// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides, sized_box_for_whitespace, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/currencyConvert.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/produk_data_controller.dart';

class ProdukDataView extends GetView<ProdukDataController> {
  final controller = Get.put(ProdukDataController());
  final produkC = Get.put(ProdukController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          width: double.infinity,
          child: FutureBuilder<QuerySnapshot<Object?>>(
              // future: sliderC.getData(),
              future: produkC.getProdukData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var listData = snapshot.data!.docs;
                  print("========================");
                  print(listData);
                  print("========================");
                  return Wrap(
                    spacing: 0,
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 10,
                    // children: List.generate(listData.length, (index) => Text((listData[index].data() as Map<String, dynamic>)['namaProduk'])),
                    children: List.generate(listData.length, (index) => ProdukCard(data: listData[index].data() as Map<String, dynamic>)),
                  );
                } else {
                  return (Center(
                    child: CircularProgressIndicator(),
                  ));
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CREATE_PRODUK),
        child: Icon(CupertinoIcons.add),
      ),
    ));
  }
}

Widget ProdukCard({
  data,
  double lebar = 175,
  double tinggi = 345,
  double lebarGambar = 175,
  double tinggiGambar = 175,
}) {
  String truncate(String text, {length = 7, omission = '...'}) {
    if (length >= text.length) {
      return text;
    }
    return text.replaceRange(length, text.length, omission);
  }

  int diskon = data['diskonProduk'];
  int harga = data['hargaProduk'];

  double convertDiskon() {
    double disk = diskon * (harga / 100);
    double hargaFix = harga - disk;
    return hargaFix;
  }

  return Container(
    // margin: EdgeInsets.only(right: marginKanan),
    // padding: EdgeInsets.symmetric(vertical: 10),
    width: lebar,
    // height: tinggi,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ], borderRadius: BorderRadius.circular(8), color: Colors.white),
    child: Column(
      children: [
        Container(
          width: lebarGambar,
          height: tinggiGambar,
          child: Image.network(data['gambarProduk']),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(truncate(data['namaProduk'], length: 30), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  CurrencyFormat.convertToIdr(convertDiskon(), 0),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 6, top: 6),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 6),
                      width: 36,
                      height: 20,
                      decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(2), color: merahTrans),
                      child: Center(
                        child: Text(
                          '${data['diskonProduk'].toString()}%',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: merah),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        CurrencyFormat.convertToIdr(data['hargaProduk'], 0),
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough, color: abuText),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      child: data['isOfficial'] ? Image.asset('assets/images/os.png') : Image.asset('assets/images/merchant.png'),
                    ),
                    Container(
                      child: Text(
                        data['daerahProduk'],
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: abuText),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 4),
                        child: Icon(
                          CupertinoIcons.star_fill,
                          color: Color(0xffffc400),
                          size: 13,
                        )),
                    Container(
                      child: Text('${data['ratingProduk'].toString()} | Terjual ${data['terjualProduk'].toString()}',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: abuText)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
