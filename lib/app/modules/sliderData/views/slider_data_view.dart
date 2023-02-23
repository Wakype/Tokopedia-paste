// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/slider_data_controller.dart';

class SliderDataView extends GetView<SliderDataController> {
  final sliderC = Get.put(SliderController());
  final controller = Get.put(SliderDataController());
  final produkC = Get.put(ProdukController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Scaffold(
      body: Container(
        child: FutureBuilder<QuerySnapshot<Object?>>(
            // future: sliderC.getData(),
            future: produkC.getProdukData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var listData = snapshot.data!.docs;
                return ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index) => ListTile(
                          onTap: () => Get.toNamed(Routes.UPDATE_SLIDER,
                              arguments: listData[index]),
                          onLongPress: () =>
                              sliderC.deleteData(listData[index].id),
                          title: Text((listData[index].data()
                              as Map<String, dynamic>)['namaProduk']),
                          subtitle: Text(
                            (listData[index].data()
                                as Map<String, dynamic>)['namaToko'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          leading: Container(
                            child: Image.network((listData[index].data()
                                as Map<String, dynamic>)['gambarProduk']),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              sliderC.deleteData((listData[index].id));
                            },
                            icon: Icon(
                              CupertinoIcons.trash,
                              color: merah,
                            ),
                          ),
                        ));
              } else {
                return (Center(
                  child: CircularProgressIndicator(),
                ));
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CREATE_SLIDER),
        child: Icon(CupertinoIcons.add),
      ),
    )));
  }
}
