import 'package:get/get.dart';

import '../controllers/create_slider_controller.dart';

class CreateSliderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateSliderController>(
      () => CreateSliderController(),
    );
  }
}
