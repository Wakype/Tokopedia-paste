import 'package:get/get.dart';

import '../controllers/produk_data_controller.dart';

class ProdukDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdukDataController>(
      () => ProdukDataController(),
    );
  }
}
