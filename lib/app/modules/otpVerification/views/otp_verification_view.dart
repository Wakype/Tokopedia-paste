// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  final controller = Get.put(OtpVerificationController());
  final authController = Get.put(AuthControllerController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;

    final defaultPinTheme = PinTheme(
      width: 100,
      height: 50,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 107, 165, 212)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: bgHeader),
      borderRadius: BorderRadius.circular(5),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(25, 70, 25, 40),
            child: Column(
              children: [
                Container(
                  height: tinggi * 0.8,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: IntrinsicWidth(
                                child: const Text(
                              'OTP verifications',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w600),
                            ))),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: IntrinsicWidth(
                                child: Text(
                                    'Connect with your favorite store today!',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: abuAbu)))),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Pinput(
                            onSubmitted: (pin) => authController.checkOTP(pin),
                            length: 6,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: submittedPinTheme,
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            // ignore: avoid_print
                            onCompleted: (pin) => authController.checkOTP(pin),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: lebar,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: bgLogin2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: lebar * 0.27,
                              height: 1,
                              color: abuAbu,
                            ),
                            Container(
                              child: Text(
                                'Or Sign Up with',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: abuAbu),
                              ),
                            ),
                            Container(
                              width: lebar * 0.27,
                              height: 1,
                              color: abuAbu,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(top: 90),
                  width: lebar,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Text(
                          'Already have an account?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: abuAbu),
                        ),
                      ),
                      Container(
                        child: InkWell(
                          onTap: () => Get.toNamed(Routes.LOGIN),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: bgLogin2),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
