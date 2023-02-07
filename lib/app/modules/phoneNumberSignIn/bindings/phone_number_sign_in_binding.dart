import 'package:get/get.dart';

import '../controllers/phone_number_sign_in_controller.dart';

class PhoneNumberSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneNumberSignInController>(
      () => PhoneNumberSignInController(),
    );
  }
}
