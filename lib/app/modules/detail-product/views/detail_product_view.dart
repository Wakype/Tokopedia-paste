// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides, sized_box_for_whitespace, avoid_web_libraries_in_flutter

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;

    String truncate(String text, {length = 7, omission = '...'}) {
      if (length >= text.length) {
        return text;
      }
      return text.replaceRange(length, text.length, omission);
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 65, 25, 15),
                  width: lebar,
                  height: 120,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: InkWell(
                                onTap: () => Get.back(),
                                child: Icon(
                                  CupertinoIcons.back,
                                  color: Colors.black,
                                  size: 26,
                                ),
                              ),
                            ),
                            Container(
                              width: lebar * 0.47,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Cari Nvidia RTX 4090™",
                                  filled: true,
                                  prefixIcon: Icon(CupertinoIcons.search),
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 2),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: abuAbu, width: 1),
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
                          ],
                        ),
                      ),
                      Container(
                        width: lebar * 0.30,
                        // color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.share_outlined,
                              color: Colors.black,
                              size: 26,
                            ),
                            Icon(
                              CupertinoIcons.cart,
                              color: Colors.black,
                              size: 26,
                            ),
                            Icon(
                              CupertinoIcons.line_horizontal_3,
                              color: Colors.black,
                              size: 26,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        width: 430,
                        // height: 430,
                        child: Image.asset('assets/images/detail/parfum.png'),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(24, 0, 24, 17),
                              margin: EdgeInsets.only(bottom: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      'Rp370.000',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    child: Icon(CupertinoIcons.heart),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(24, 0, 24, 17),
                              child: Text(
                                  'Mine. Perfumery ETHEREAL - 50ml Eau De Parfum',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Container(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 24,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 16),
                                      child: Text('Terjual 250+',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    CardSampingTerjual(
                                        text: '4.9 (320)',
                                        widget: Container(
                                          margin: EdgeInsets.only(right: 7),
                                          child: Icon(
                                            CupertinoIcons.star_fill,
                                            color: Color(0xffffc400),
                                            size: 15,
                                          ),
                                        )),
                                    CardSampingTerjual(
                                        text: 'Foto pembeli (50)',
                                        widget: Container()),
                                    CardSampingTerjual(
                                        text: 'Diskusi (25)',
                                        widget: Container()),
                                    SizedBox(
                                      width: 18,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 17, bottom: 22),
                  width: lebar,
                  height: 8,
                  decoration: BoxDecoration(color: Color(0xffeeeeee)),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                        margin: EdgeInsets.only(bottom: 24),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 24),
                              alignment: Alignment.centerLeft,
                              child: Text('Detail Produk',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                            DetailDiveder(
                                context: context,
                                text1: 'Berat Satuan',
                                text2: '200 g',
                                textWeight: FontWeight.w400,
                                textcolor: Colors.black),
                            DetailDiveder(
                                context: context,
                                text1: 'Etalase',
                                text2: 'Mine Private Collection',
                                textWeight: FontWeight.w600,
                                textcolor: bgLogin2),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 24),
                              alignment: Alignment.centerLeft,
                              child: Text('Deskripsi Produk',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 12),
                              child: Text(
                                  truncate(
                                      'Mine. ETHEREAL Eau De Parfum 50mi glass perfume bottle in hard box packaging • ETHEREAL • With facets that highlight a side ...',
                                      length: 127),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text('Baca Selengkapnya',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: bgLogin2)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 24, 0, 24),
                        width: lebar,
                        height: 1,
                        color: abuAbu,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(right: 16),
                                      width: 75,
                                      child: Image.asset(
                                          'assets/images/detail/fotoPenjual.png')),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 12),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Image.asset(
                                                    'assets/images/detail/os.png'),
                                              ),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Mine. Parfumery',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 6),
                                          alignment: Alignment.centerLeft,
                                          child: Text('Online 23 Jam lalu',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Kota Tangerang',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: InkWell(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 17),
                                  width: 83,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 1, color: bgLogin2)),
                                  child: Text(
                                    'Follow',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: bgLogin2),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25, bottom: 22),
                  width: lebar,
                  height: 8,
                  decoration: BoxDecoration(color: Color(0xffeeeeee)),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Lainnya di toko ini',
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
                                  SizedBox(
                                    width: 24,
                                  ),
                                  ProdukCard(
                                      daerah: 'Kota Tangerang',
                                      harga: 'Rp 370.000',
                                      produk: 'Mine. Perfumery FLORAISON ...',
                                      rating: '4.8',
                                      terjual: '312',
                                      gambar:
                                          'assets/images/detail/parfum1.png'),
                                  ProdukCard(
                                      daerah: 'Kota Tangerang',
                                      harga: 'Rp 450.000',
                                      produk:
                                          'Mine. Perfumery TATMI - 50ml ...',
                                      rating: '4.9',
                                      terjual: '150',
                                      gambar:
                                          'assets/images/detail/parfum2.png'),
                                  ProdukCard(
                                      daerah: 'Kota Tangerang',
                                      harga: 'Rp 370.000',
                                      produk: 'Mine. Perfumery FLORAISON ...',
                                      rating: '4.8',
                                      terjual: '312',
                                      gambar:
                                          'assets/images/detail/parfum1.png'),
                                  ProdukCard(
                                      daerah: 'Kota Tangerang',
                                      harga: 'Rp 450.000',
                                      produk:
                                          'Mine. Perfumery TATMI - 50ml ...',
                                      rating: '4.9',
                                      terjual: '150',
                                      gambar:
                                          'assets/images/detail/parfum2.png'),
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24, bottom: 22),
                  width: lebar,
                  height: 8,
                  decoration: BoxDecoration(color: Color(0xffeeeeee)),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 23),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Ulasan pembeli',
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
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Container(
                                      child: Icon(
                                    CupertinoIcons.star_fill,
                                    size: 22,
                                    color: Color(0xffffc400),
                                  )),
                                  Container(
                                    margin: EdgeInsets.only(right: 6, left: 8),
                                    child: Text(
                                      '4.9',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '320 rating ∙ 102 ulasan',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: abuAbu),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Image.asset(
                                        'assets/images/detail/ulasan1.png'),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Image.asset(
                                        'assets/images/detail/ulasan2.png'),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Image.asset(
                                        'assets/images/detail/ulasan3.png'),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Image.asset(
                                        'assets/images/detail/ulasan4.png'),
                                  ),
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/detail/ulasan5.png'))),
                                    child: Center(
                                      child: Text(
                                        '+61',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 24),
                              width: lebar,
                              height: 1,
                              color: Color(0xffeeeeee),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 13),
                                          width: 50,
                                          height: 50,
                                          child: Image.asset(
                                              'assets/images/detail/ulasanPembeli.png'),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child:
                                                    Text('Zain Ekstrom Bothman',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        )),
                                              ),
                                              Container(
                                                child: Text(
                                                    '31 ulasan lengkap ∙ 17 terbantu',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: abuAbu)),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 13),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 7),
                                          width: 95,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                CupertinoIcons.star_fill,
                                                color: Color(0xffffc400),
                                                size: 16,
                                              ),
                                              Icon(
                                                CupertinoIcons.star_fill,
                                                color: Color(0xffffc400),
                                                size: 16,
                                              ),
                                              Icon(
                                                CupertinoIcons.star_fill,
                                                color: Color(0xffffc400),
                                                size: 16,
                                              ),
                                              Icon(
                                                CupertinoIcons.star_fill,
                                                color: Color(0xffffc400),
                                                size: 16,
                                              ),
                                              Icon(
                                                CupertinoIcons.star_fill,
                                                color: Color(0xffffc400),
                                                size: 16,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            child: Text('10 bulan lalu',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: abuAbu))),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 12),
                                          child: Text(
                                              'saya selalu tertarik dengan produk lokal, buat saya aroma nomor 2 karena subyektif, Kemasan nomorselanjutnya, tapi yang perlu di',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Baca Selengkapnya',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: bgHeader)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24, bottom: 22),
                  width: lebar,
                  height: 8,
                  decoration: BoxDecoration(color: Color(0xffeeeeee)),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                'Diskusi',
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
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                        child: Column(
                          children: [
                            DiskusiUser(
                                marginBawah: 12,
                                marginKiri: 0,
                                bgProfile:
                                    'assets/images/detail/diskusiUser1.png',
                                comment:
                                    'hai! kira-kira kapan restock lagi? thanks in advance',
                                widgetNama: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'Rayna Stanton ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: '∙ Apr 2022',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: abuAbu),
                                      ),
                                    ],
                                  ),
                                )),
                            DiskusiUser(
                                marginBawah: 0,
                                bgProfile:
                                    'assets/images/detail/diskusiUser2.png',
                                comment:
                                    'Halo kak, maaf banget yak karena kamu jadi nunggu, saat ini kita masih out of stock ya ...',
                                marginKiri: 32,
                                widgetNama: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 6),
                                      width: 70,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: hijauTrans),
                                      child: Center(
                                        child: Text('Penjual',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: bgHeader)),
                                      ),
                                    ),
                                    Container(
                                      child: Text('∙ Apr 2022'),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24, bottom: 24),
                  width: lebar,
                  height: 8,
                  decoration: BoxDecoration(color: Color(0xffeeeeee)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 12),
                        child: Icon(
                          CupertinoIcons.info_circle,
                          size: 24,
                        ),
                      ),
                      Container(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Produk bermasalah? ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Laporkan',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: bgHeader),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: Color(0xffeeeeee)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1.5, color: abuAbu)),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.chat_bubble_text,
                            size: 26,
                          ),
                        ),
                      ),
                      Container(
                        width: lebar * 0.35,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1.5, color: bgHeader)),
                        child: Center(
                            child: Text(
                          'Beli Langsung',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: bgHeader),
                        )),
                      ),
                      Container(
                        width: lebar * 0.35,
                        height: 50,
                        decoration: BoxDecoration(
                            color: bgHeader,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1.5, color: bgHeader)),
                        child: Center(
                            child: Text(
                          '+Keranjang',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                      ),
                    ],
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

Widget DiskusiUser(
    {widgetNama,
    bgProfile,
    comment,
    required double marginKiri,
    required double marginBawah}) {
  return Container(
    margin: EdgeInsets.only(left: marginKiri, bottom: marginBawah),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 12),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 12,
                ),
                width: 35,
                height: 35,
                child: Image.asset(bgProfile),
              ),
              Container(
                child: widgetNama,
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            comment,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        )
      ],
    ),
  );
}

Widget CardSampingTerjual({widget, text}) {
  return Container(
    margin: EdgeInsets.only(right: 6),
    padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: abuAbu)),
    child: Row(
      children: [
        widget,
        Container(
          child: Text(text,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        )
      ],
    ),
  );
}

Widget DetailDiveder(
    {text1, text2, textcolor, textWeight, required BuildContext context}) {
  double tinggi = MediaQuery.of(context).size.height;
  double lebar = MediaQuery.of(context).size.width;
  return Container(
    margin: EdgeInsets.only(bottom: 12),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: abuAbu))),
          child: Row(
            children: [
              Container(
                width: lebar * 0.45,
                child: Text(text1,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: abuAbu)),
              ),
              Container(
                child: Text(text2,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: textWeight,
                        color: textcolor)),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget ProdukCard(
    {gambar,
    harga,
    diskon = 'Cashback',
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
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 6, top: 6),
                child: Container(
                  margin: EdgeInsets.only(right: 6),
                  width: 75,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(2),
                      color: hijauTrans),
                  child: Center(
                    child: Text(
                      diskon,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: bgHeader),
                    ),
                  ),
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
