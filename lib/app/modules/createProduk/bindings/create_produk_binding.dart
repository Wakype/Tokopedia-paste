import 'package:get/get.dart';

import '../controllers/create_produk_controller.dart';

class CreateProdukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProdukController>(
      () => CreateProdukController(),
    );
  }
}
