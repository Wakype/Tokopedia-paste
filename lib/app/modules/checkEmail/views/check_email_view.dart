// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides

import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/check_email_controller.dart';

class CheckEmailView extends GetView<CheckEmailController> {
  const CheckEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(25, 70, 25, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: tinggi * 0.75,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 145,
                        height: 145,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(30, 13, 129, 115),
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage('assets/images/mail.png'))),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        child: Text(
                          'Check Your Email',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: Text(
                          'We have sent a password recover instructions to your email.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: abuAbu),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: InkWell(
                          onTap: () async {
                            await LaunchApp.openApp(
                              androidPackageName: 'com.google.android.gm',
                              iosUrlScheme: 'googlegmail://',
                              appStoreLink:
                                  'itms-apps://apps.apple.com/us/app/gmail-email-by-google/id422689480',
                            );
                          },
                          child: Container(
                            width: lebar * 0.4,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: bgLogin2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Open Email App',
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
                        margin: EdgeInsets.only(top: 50),
                        child: InkWell(
                          onTap: () => Get.toNamed(Routes.LOGIN),
                          child: Text(
                            'Skip, I`ll confirm later',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: abuAbu,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  width: 310,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          'Did not receive the email? Check your spam filter, or ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: abuAbu),
                      children: [
                        TextSpan(
                          text: 'try another email address',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: bgLogin2),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
