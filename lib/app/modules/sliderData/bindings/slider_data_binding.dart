import 'package:get/get.dart';

import '../controllers/slider_data_controller.dart';

class SliderDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliderDataController>(
      () => SliderDataController(),
    );
  }
}
