// ignore_for_file: unnecessary_overrides, unused_import, avoid_print, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

class AuthControllerController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> streamAuthStatus() => auth.authStateChanges();

  login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            title: 'Alert', middleText: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: 'Alert',
          middleText: 'Wrong password provided for that user.',
        );
      }
    }
  }

  registeer(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.toNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: 'Alert',
          middleText: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: 'Alert',
          middleText: 'The account already exists for that email.',
        );
      }
    } catch (e) {
      print(e);
    }
  }

  signOut() {
    try {
      Get.defaultDialog(
          title: 'Warning',
          middleText: "Are you sure you want to sign out?",
          confirm: InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
          cancel: InkWell(
            onTap: () async {
              Get.back();
            },
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text(
                'No',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ));
    } on FirebaseAuthException catch (err) {
      print(err);
    }
  }
}
