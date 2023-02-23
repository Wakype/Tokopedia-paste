import 'package:get/get.dart';

import '../modules/SplashScreen/bindings/splash_screen_binding.dart';
import '../modules/SplashScreen/views/splash_screen_view.dart';
import '../modules/checkEmail/bindings/check_email_binding.dart';
import '../modules/checkEmail/views/check_email_view.dart';
import '../modules/createProduk/bindings/create_produk_binding.dart';
import '../modules/createProduk/views/create_produk_view.dart';
import '../modules/createSlider/bindings/create_slider_binding.dart';
import '../modules/createSlider/views/create_slider_view.dart';
import '../modules/detail-product/bindings/detail_product_binding.dart';
import '../modules/detail-product/views/detail_product_view.dart';
import '../modules/forgotPassword/bindings/forgot_password_binding.dart';
import '../modules/forgotPassword/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homeAdmin/bindings/home_admin_binding.dart';
import '../modules/homeAdmin/views/home_admin_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/otpVerification/bindings/otp_verification_binding.dart';
import '../modules/otpVerification/views/otp_verification_view.dart';
import '../modules/phoneNumberSignIn/bindings/phone_number_sign_in_binding.dart';
import '../modules/phoneNumberSignIn/views/phone_number_sign_in_view.dart';
import '../modules/produkData/bindings/produk_data_binding.dart';
import '../modules/produkData/views/produk_data_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/sliderData/bindings/slider_data_binding.dart';
import '../modules/sliderData/views/slider_data_view.dart';
import '../modules/updateSlider/bindings/update_slider_binding.dart';
import '../modules/updateSlider/views/update_slider_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_EMAIL,
      page: () => const CheckEmailView(),
      binding: CheckEmailBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT,
      page: () => const DetailProductView(),
      binding: DetailProductBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_NUMBER_SIGN_IN,
      page: () => PhoneNumberSignInView(),
      binding: PhoneNumberSignInBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.SLIDER_DATA,
      page: () => SliderDataView(),
      binding: SliderDataBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_SLIDER,
      page: () => CreateSliderView(),
      binding: CreateSliderBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_SLIDER,
      page: () => UpdateSliderView(),
      binding: UpdateSliderBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK_DATA,
      page: () => ProdukDataView(),
      binding: ProdukDataBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRODUK,
      page: () => CreateProdukView(),
      binding: CreateProdukBinding(),
    ),
  ];
}
