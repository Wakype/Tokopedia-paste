// ignore_for_file: unnecessary_overrides, unused_import, avoid_print, prefer_const_constructors, unused_local_variable, unused_catch_clause

import 'dart:developer';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';

class SliderDataController extends GetxController {
  final count = 0.obs;
  var data;
  @override
  void onInit() {
    SliderController().getData();

    print('jalan');
    print(data);
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
