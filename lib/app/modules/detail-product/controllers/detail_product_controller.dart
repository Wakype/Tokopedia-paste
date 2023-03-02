// ignore_for_file: unnecessary_overrides, unused_import, avoid_print, prefer_const_constructors, unused_local_variable, unused_catch_clause, non_constant_identifier_names

import 'package:get/get.dart';

class DetailProductController extends GetxController {
  final data = Get.arguments;
  

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
