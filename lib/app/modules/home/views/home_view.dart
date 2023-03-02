// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides, sized_box_for_whitespace

// import 'dart:html';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/currencyConvert.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  final authController = Get.put(AuthControllerController());
  final sliderC = Get.put(SliderController());
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
                  padding: EdgeInsets.fromLTRB(25, 65, 25, 15),
                  width: lebar,
                  height: 120,
                  decoration: BoxDecoration(color: bgHeader),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: lebar * 0.45,
                        // height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Cari Nvidia RTX 4090™",
                            filled: true,
                            prefixIcon: Icon(CupertinoIcons.search),
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 2),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.circular(6),
                              gapPadding: 5,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(color: Colors.transparent, width: 1),
                              gapPadding: 5,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: lebar * 0.38,
                        // color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              CupertinoIcons.mail,
                              color: Colors.white,
                              size: 26,
                            ),
                            Icon(
                              CupertinoIcons.bell,
                              color: Colors.white,
                              size: 26,
                            ),
                            Icon(
                              CupertinoIcons.cart,
                              color: Colors.white,
                              size: 26,
                            ),
                            InkWell(
                              onTap: () => authController.signOut(),
                              child: Icon(
                                CupertinoIcons.line_horizontal_3,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<QuerySnapshot<Object?>>(
                  future: sliderC.getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var listData = snapshot.data!.docs;

                      return Container(
                          margin: EdgeInsets.only(top: 16),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 130,
                              autoPlay: true,
                              autoPlayCurve: Curves.easeInOutQuart,
                            ),
                            items: listData.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                      width: lebar,
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadiusDirectional.circular(8)),
                                      child: Image.network(
                                        (i.data() as Map<String, dynamic>)['gambarSlider'],
                                        fit: BoxFit.fill,
                                      ));
                                  //       (listData[index].data()
                                  // as Map<String, dynamic>)['gambarProduk']
                                },
                              );
                            }).toList(),
                          ));
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 13,
                    runSpacing: 20,
                    children: [
                      CustomIcon(icon: "assets/images/menu/promo.png", text: 'promo'),
                      CustomIcon(icon: "assets/images/menu/toserba.png", text: 'Toserba'),
                      CustomIcon(icon: "assets/images/menu/elektronik.png", text: 'Elektronik'),
                      CustomIcon(icon: "assets/images/menu/tagihan.png", text: 'Top-Up & tagihan'),
                      CustomIcon(icon: "assets/images/menu/semua.png", text: 'Lihat semua'),
                      CustomIcon(icon: "assets/images/menu/official.png", text: 'Official Store'),
                      CustomIcon(icon: "assets/images/menu/play.png", text: 'Live shopping'),
                      CustomIcon(icon: "assets/images/menu/seru.png", text: 'Tokopedia Seru'),
                      CustomIcon(icon: "assets/images/menu/cod.png", text: 'Bayar di tempat'),
                      CustomIcon(icon: "assets/images/menu/indo.png", text: 'Bangga lokal'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 24),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 24),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 12),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Kejar Diskon Spesial',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text('Berakhir dalam', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: abuText)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      width: 112,
                                      height: 26,
                                      decoration: BoxDecoration(color: merah, borderRadius: BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(CupertinoIcons.time, size: 16, color: Colors.white),
                                          Text(
                                            '00 : 15 : 12',
                                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Lihat Semua', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: bgHeader)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: lebar,
                        height: 350,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xff01A0C6),
                            Color(0xff01AA6C),
                          ],
                        )),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                height: 350,
                                margin: EdgeInsets.only(right: 32),
                                child: Image.asset('assets/images/kejarDiskon.png'),
                              ),

                              FutureBuilder<QuerySnapshot<Object?>>(
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
                                        children: List.generate(
                                            listData.length,
                                            (index) =>
                                                KejarDiskonCard(data: listData[index].data() as Map<String, dynamic>, page: Routes.DETAIL_PRODUCT, arguments: listData[index])),
                                      );
                                    } else {
                                      return (Center(
                                        child: CircularProgressIndicator(),
                                      ));
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Pilihan Promo Hari Ini',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              child: Text('Lihat Semua', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: bgHeader)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 25,
                                ),
                                PilihanPromoCard(gambar: 'assets/images/ohBeauty.png'),
                                PilihanPromoCard(gambar: 'assets/images/toserbaPromo.png'),
                                PilihanPromoCard(gambar: 'assets/images/ohBeauty.png'),
                                PilihanPromoCard(gambar: 'assets/images/toserbaPromo.png'),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 25),
                  width: lebar,
                  height: 2,
                  color: Color(0xffeeeeee),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Produk Pilihan Untukmu',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              child: Text('Lihat Semua', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: bgHeader)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          height: 355,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                              ),
                              FutureBuilder<QuerySnapshot<Object?>>(
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
                                        children: List.generate(
                                            listData.length, (index) => ProdukCard(data: listData[index].data() as Map<String, dynamic>)),
                                      );
                                    } else {
                                      return (Center(
                                        child: CircularProgressIndicator(),
                                      ));
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 25),
                  width: lebar,
                  height: 8,
                  color: Color(0xffeeeeee),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        CatalogContainer(
                            text: 'For Hilmi',
                            gradient1: 0xffFA38B1,
                            gradient2: 0xffA92176,
                            widget: Container(
                              width: 25,
                              height: 3,
                              margin: EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.white),
                            )),
                        CatalogContainer(text: 'Special Discount', gradient1: 0xff8A40FF, gradient2: 0xff462180, widget: Container()),
                        CatalogContainer(text: 'Aktifitasmu', gradient1: 0xff3BD5FF, gradient2: 0xff0C87A9, widget: Container()),
                        CatalogContainer(text: 'Gaming Setups', gradient1: 0xffFFBE53, gradient2: 0xffEE9B12, widget: Container()),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  width: double.infinity,
                  child: FutureBuilder<QuerySnapshot<Object?>>(
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
                            runSpacing: 20,
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
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                  width: lebar,
                  height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(width: 1, color: abuAbu)),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        'Lihat Selebihnya',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget CatalogContainer({text, gradient1, gradient2, widget}) {
  return Container(
    margin: EdgeInsets.only(right: 12),
    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
    width: 114,
    height: 66,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(gradient1),
            Color(gradient2),
          ],
        )),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget,
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        )
      ],
    ),
  );
}

Widget CustomIcon({icon, text}) {
  return Container(
    width: 65,
    child: Column(
      children: [
        Container(
          child: Image.asset(icon),
        ),
        Container(
          margin: EdgeInsets.only(top: 7),
          // width: widht,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

Widget PilihanPromoCard({gambar}) {
  return Container(
    margin: EdgeInsets.only(right: 12),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
    width: 150,
    height: 262.5,
    child: Image.asset(
      gambar,
    ),
  );
}

Widget KejarDiskonCard({data, page, arguments}) {
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
    margin: EdgeInsets.only(right: 15),
    width: 146,
    height: 325,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
    child: InkWell(
      onTap: () => Get.toNamed(page, arguments: arguments),
      child: Column(
        children: [
          Container(
            width: 146,
            height: 146,
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
                  child: Text(truncate(data['namaProduk'], length: 22), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
                  margin: EdgeInsets.only(bottom: 6),
                  child: StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 80,
                    size: 4,
                    padding: 0,
                    selectedColor: merah,
                    unselectedColor: Color(0xffeeeeee),
                    roundedEdges: Radius.circular(2),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Segera Habis', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: abuText)),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget ProdukCard({data, double lebar = 146, double tinggi = 316, double lebarGambar = 146, double tinggiGambar = 146, double marginKanan = 15}) {
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
    margin: EdgeInsets.only(right: marginKanan),
    // padding: EdgeInsets.symmetric(vertical: 10),
    width: lebar,
    height: tinggi,
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
                child: Text(truncate(data['namaProduk'], length: 22), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
