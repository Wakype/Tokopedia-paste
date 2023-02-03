// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  final controller = Get.put(ForgotPasswordController());
  final authController = Get.put(AuthControllerController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(25, 70, 25, 40),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () => Get.toNamed(Routes.LOGIN),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: IntrinsicWidth(
                              child: const Text(
                            'Create Account',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w600),
                          ))),
                    ),
                    Container(
                      // width: 400,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 25),
                      child: Text(
                          'Enter the email associated with your account and we`ll send an email with instructions to reset your password.',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: abuAbu)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Email address',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                                controller: controller.email,
                                obscureText: false,
                                decoration: InputDecoration(
                                  // labelText: customLabel,
                                  labelStyle: const TextStyle(
                                    fontFamily: "Poppins",
                                    color: Colors.black,
                                    fontSize: 19,
                                  ),
                                  hintText: 'Enter your email address',
                                  hintStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: abuAbu,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 18,
                                  ),
                                  suffixIcon: Icon(Icons.email_outlined),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide:
                                        BorderSide(color: abuAbu, width: 1),
                                    gapPadding: 5,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(255, 27, 27, 27),
                                        width: 1),
                                    gapPadding: 5,
                                  ),
                                  // filled: true,
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 50),
                            child: InkWell(
                              onTap: () => authController
                                  .resetPassword(controller.email.text),
                              // onTap: () => Get.toNamed(Routes.CHECK_EMAIL),
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
                                      'Send Instructions',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
