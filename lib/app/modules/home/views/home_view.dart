// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides, sized_box_for_whitespace

// import 'dart:html';
// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  final authController = Get.put(AuthControllerController());

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
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.circular(6),
                              gapPadding: 5,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1),
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
                Container(
                    margin: EdgeInsets.only(top: 16),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 130,
                        autoPlay: true,
                        autoPlayCurve: Curves.easeInOutQuart,
                      ),
                      items: [
                        'assets/images/kebut.png',
                        'assets/images/keju.png',
                        'assets/images/belanja.png'
                      ].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: lebar,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(8)),
                                child: Image.asset(
                                  i,
                                  fit: BoxFit.fill,
                                ));
                          },
                        );
                      }).toList(),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 13,
                    runSpacing: 20,
                    children: [
                      CustomIcon(
                          icon: "assets/images/menu/promo.png", text: 'promo'),
                      CustomIcon(
                          icon: "assets/images/menu/toserba.png",
                          text: 'Toserba'),
                      CustomIcon(
                          icon: "assets/images/menu/elektronik.png",
                          text: 'Elektronik'),
                      CustomIcon(
                          icon: "assets/images/menu/tagihan.png",
                          text: 'Top-Up & tagihan'),
                      CustomIcon(
                          icon: "assets/images/menu/semua.png",
                          text: 'Lihat semua'),
                      CustomIcon(
                          icon: "assets/images/menu/official.png",
                          text: 'Official Store'),
                      CustomIcon(
                          icon: "assets/images/menu/play.png",
                          text: 'Live shopping'),
                      CustomIcon(
                          icon: "assets/images/menu/seru.png",
                          text: 'Tokopedia Seru'),
                      CustomIcon(
                          icon: "assets/images/menu/cod.png",
                          text: 'Bayar di tempat'),
                      CustomIcon(
                          icon: "assets/images/menu/indo.png",
                          text: 'Bangga lokal'),
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
                                      child: Text('Berakhir dalam',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: abuText)),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: 112,
                                      height: 26,
                                      decoration: BoxDecoration(
                                          color: merah,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(CupertinoIcons.time,
                                              size: 16, color: Colors.white),
                                          Text(
                                            '00 : 15 : 12',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Lihat Semua',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: bgHeader)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: lebar,
                        height: 310,
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
                                margin: EdgeInsets.only(right: 32),
                                child: Image.asset(
                                    'assets/images/kejarDiskon.png'),
                              ),
                              Row(
                                children: [
                                  KejarDiskonCard(
                                      gambar: 'assets/images/masker.png',
                                      daerah: 'Kab. Bandung',
                                      diskon: '92%',
                                      harga: 'Rp 1.000',
                                      totalPersen: 100,
                                      currentPersen: 80,
                                      potongan: 'Rp 12.546',
                                      status: 'Segera Habis',
                                      page: Routes.DETAIL_PRODUCT),
                                  KejarDiskonCard(
                                      gambar: 'assets/images/colokan.png',
                                      daerah: 'Jakarta Timur',
                                      diskon: '6%',
                                      harga: 'Rp 103.000',
                                      totalPersen: 100,
                                      currentPersen: 35,
                                      potongan: 'Rp 109.900',
                                      status: 'Tersedia')
                                ],
                              )
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
                              child: Text('Lihat Semua',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: bgHeader)),
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
                                PilihanPromoCard(
                                    gambar: 'assets/images/ohBeauty.png'),
                                PilihanPromoCard(
                                    gambar: 'assets/images/toserbaPromo.png'),
                                PilihanPromoCard(
                                    gambar: 'assets/images/ohBeauty.png'),
                                PilihanPromoCard(
                                    gambar: 'assets/images/toserbaPromo.png'),
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
                              child: Text('Lihat Semua',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: bgHeader)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: 340,
                            child: Row(
                              children: [
                                SizedBox(width: 25),
                                ProdukCard(
                                    produk: 'Logitech G603 Lightspeed High DPI',
                                    daerah: 'Kab. Bandung',
                                    diskon: '44%',
                                    gambar: 'assets/images/mouse.png',
                                    harga: 'Rp 609.000',
                                    potongan: 'Rp 1.000.000',
                                    rating: '4.8',
                                    terjual: '312'),
                                ProdukCard(
                                    produk: 'Logitech G203 Mouse Gaming',
                                    daerah: 'Kab. Bandung',
                                    diskon: '46%',
                                    gambar: 'assets/images/mouseBanyak.png',
                                    harga: 'Rp 204.000',
                                    potongan: 'Rp 379.000',
                                    rating: '4.9',
                                    terjual: '6rb'),
                                ProdukCard(
                                    produk: 'Logitech G603 Lightspeed High DPI',
                                    daerah: 'Kab. Bandung',
                                    diskon: '44%',
                                    gambar: 'assets/images/mouse.png',
                                    harga: 'Rp 609.000',
                                    potongan: 'Rp 1.000.000',
                                    rating: '4.8',
                                    terjual: '312'),
                                ProdukCard(
                                    produk: 'Logitech G203 Mouse Gaming',
                                    daerah: 'Kab. Bandung',
                                    diskon: '46%',
                                    gambar: 'assets/images/mouseBanyak.png',
                                    harga: 'Rp 204.000',
                                    potongan: 'Rp 379.000',
                                    rating: '4.9',
                                    terjual: '6rb'),
                              ],
                            ),
                          ),
                        ),
                      )
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.white),
                            )),
                        CatalogContainer(
                            text: 'Special Discount',
                            gradient1: 0xff8A40FF,
                            gradient2: 0xff462180,
                            widget: Container()),
                        CatalogContainer(
                            text: 'Aktifitasmu',
                            gradient1: 0xff3BD5FF,
                            gradient2: 0xff0C87A9,
                            widget: Container()),
                        CatalogContainer(
                            text: 'Gaming Setups',
                            gradient1: 0xffFFBE53,
                            gradient2: 0xffEE9B12,
                            widget: Container()),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                  child: Wrap(spacing: 15, runSpacing: 20, children: [
                    ProdukCard(
                        gambar: 'assets/images/steelseries.png',
                        daerah: 'Jakarta Pusat',
                        diskon: '12%',
                        harga: 'Rp 699.000',
                        potongan: 'Rp 790.000',
                        produk: 'SteelSeries Rival 3 Wireless - Gaming ...',
                        rating: '5.0',
                        tinggi: 340,
                        lebar: 165,
                        tinggiGambar: 165,
                        lebarGambar: 165,
                        marginKanan: 0,
                        terjual: '124'),
                    ProdukCard(
                        gambar: 'assets/images/monitor.png',
                        daerah: 'Kota Depok',
                        diskon: '44%',
                        harga: 'Rp 5.949.900',
                        potongan: 'Rp 1.000.000',
                        produk: 'Monitor Lenovo G34W-30 34" ...',
                        rating: '5.0',
                        tinggi: 340,
                        lebar: 165,
                        tinggiGambar: 165,
                        lebarGambar: 165,
                        marginKanan: 0,
                        terjual: '23'),
                    ProdukCard(
                        gambar: 'assets/images/colokan.png',
                        daerah: 'Kab. Tangerang',
                        diskon: '44%',
                        harga: 'Rp 3.750',
                        potongan: 'Rp 1.000.000',
                        produk: 'Myvo Steker T Multi Lampu Colokan ...',
                        rating: '5.0',
                        tinggi: 340,
                        lebar: 165,
                        tinggiGambar: 165,
                        lebarGambar: 165,
                        marginKanan: 0,
                        terjual: '76'),
                    ProdukCard(
                        gambar: 'assets/images/logitech.png',
                        daerah: 'Kab. Bandung',
                        diskon: '44%',
                        harga: 'Rp 609.000',
                        potongan: 'Rp 1.000.000',
                        produk: 'Logitech G PRO X SUPERLIGHT ...',
                        rating: '5.0',
                        tinggi: 340,
                        lebar: 165,
                        tinggiGambar: 165,
                        lebarGambar: 165,
                        marginKanan: 0,
                        terjual: '1rb'),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                  width: lebar,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 1, color: abuAbu)),
                  child: InkWell(
                    child: Center(
                      child: Text(
                        'Lihat Selebihnya',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
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
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
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

Widget KejarDiskonCard(
    {gambar,
    harga,
    diskon,
    potongan,
    daerah,
    status,
    totalPersen,
    currentPersen,
    page}) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    width: 146,
    height: 276,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: Colors.white),
    child: InkWell(
      onTap: () => Get.toNamed(page),
      child: Column(
        children: [
          Container(
            width: 146,
            height: 146,
            child: Image.asset(gambar),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
            child: Column(
              children: [
                Container(
                  // margin: EdgeInsets.only(bottom: 6),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    harga,
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(2),
                            color: merahTrans),
                        child: Center(
                          child: Text(
                            diskon,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: merah),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          potongan,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                              color: abuText),
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
                        child: Image.asset('assets/images/os.png'),
                      ),
                      Container(
                        child: Text(
                          daerah,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: abuText),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: StepProgressIndicator(
                    totalSteps: totalPersen,
                    currentStep: currentPersen,
                    size: 4,
                    padding: 0,
                    selectedColor: merah,
                    unselectedColor: Color(0xffeeeeee),
                    roundedEdges: Radius.circular(2),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(status,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: abuText)),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget ProdukCard(
    {gambar,
    harga,
    diskon,
    potongan,
    daerah,
    terjual,
    rating,
    produk,
    double lebar = 146,
    double tinggi = 316,
    double lebarGambar = 146,
    double tinggiGambar = 146,
    double marginKanan = 15}) {
  String truncate(String text, {length = 7, omission = '...'}) {
    if (length >= text.length) {
      return text;
    }
    return text.replaceRange(length, text.length, omission);
  }

// void main() {
//   print(truncate('Hello, World!', length: 4));
// }
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
          child: Image.asset(gambar),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(truncate(produk, length: 25),
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  harga,
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(2),
                          color: merahTrans),
                      child: Center(
                        child: Text(
                          diskon,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: merah),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        potongan,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            color: abuText),
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
                      child: Image.asset('assets/images/merchant.png'),
                    ),
                    Container(
                      child: Text(
                        daerah,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: abuText),
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
                      child: Text('$rating | Terjual $terjual',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: abuText)),
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


// Container(
                              //     child: CarouselSlider(
                              //   options: CarouselOptions(
                              //     // height: 130,
                              //     // autoPlay: true,
                              //     autoPlayCurve: Curves.easeInOutQuart,
                              //   ),
                              //   items: [
                              //     KejarDiskonCard(
                              //         gambar: 'assets/images/masker.png',
                              //         daerah: 'Kab. Bandung',
                              //         diskon: '92%',
                              //         harga: 'Rp 1.000',
                              //         totalPersen: 100,
                              //         currentPersen: 80,
                              //         potongan: 'Rp 12.546',
                              //         status: 'Segera Habis'),
                              //     KejarDiskonCard(
                              //         gambar: 'assets/images/colokan.png',
                              //         daerah: 'Jakarta Timur',
                              //         diskon: '6%',
                              //         harga: 'Rp 103.000',
                              //         totalPersen: 100,
                              //         currentPersen: 35,
                              //         potongan: 'Rp 109.900',
                              //         status: 'Tersedia')
                              //   ].map((i) {
                              //     return Builder(
                              //       builder: (BuildContext context) {
                              //         return i;
                              //       },
                              //     );
                              //   }).toList(),
                              // )),