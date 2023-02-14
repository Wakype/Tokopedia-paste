// ignore_for_file: unnecessary_overrides, unused_import, avoid_print, prefer_const_constructors, unused_local_variable, unused_catch_clause, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateSliderController extends GetxController {
  final aktifasi = true.obs;
  changeActivation() => aktifasi.toggle();

  TextEditingController gambarSlider = TextEditingController();
  TextEditingController deskripsiSlider = TextEditingController();

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
