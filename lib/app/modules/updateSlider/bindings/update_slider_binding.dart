import 'package:get/get.dart';

import '../controllers/update_slider_controller.dart';

class UpdateSliderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateSliderController>(
      () => UpdateSliderController(),
    );
  }
}
