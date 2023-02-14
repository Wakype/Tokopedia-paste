// ignore_for_file: prefer_const_constructors, unused_local_variable, unnecessary_import, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(20, 50, 30, 20),
            height: tinggi,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [bgLogin, bgLogin2])),
            child: Column(
              children: [
                Container(
                  height: tinggi * 0.85,
                  child: Column(
                    children: [
                      Container(
                        width: lebar,
                        height: tinggi * 0.3,
                        margin: EdgeInsets.only(bottom: 30, top: 50),
                        decoration: BoxDecoration(
                            // color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage('assets/images/sp.png'))),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        // width: lebar * 0.6,
                        child: Text(
                          "Let's Get Started",
                          style: TextStyle(
                              height: 1.3,
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: 350,
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Connect with each other with buying or selling. Enjoy safe and private commersing',
                          style: TextStyle(
                              height: 1.3,
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      InkWell(
                          onTap: () => Get.toNamed(Routes.OTP_VERIFICATION),
                          child: Container(
                            margin: EdgeInsets.only(top: 40),
                            width: lebar,
                            height: 55,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text(
                                'Join Now',
                                style: TextStyle(
                                    color: bgLogin2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(top: 15),
                  width: lebar,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                            height: 1.3,
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          onTap: () => Get.toNamed(Routes.LOGIN),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                height: 1.3,
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(top: 15),
                  width: lebar,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Or Sign in with',
                        style: TextStyle(
                            height: 1.3,
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          onTap: () => Get.toNamed(Routes.PHONE_NUMBER_SIGN_IN),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                                height: 1.3,
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),
                ),
              ],
            )));
  }
}
