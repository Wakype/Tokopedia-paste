// ignore_for_file: unnecessary_overrides, unused_import, avoid_print, prefer_const_constructors, unused_local_variable, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

class AuthControllerController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> streamAuthStatus() => auth.authStateChanges();
  String verificationCode = "";

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
      credential.user?.sendEmailVerification();

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

  resetPassword(String email) async {
    try {
      final credential = await auth.sendPasswordResetEmail(email: email);

      Get.toNamed(Routes.CHECK_EMAIL);
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(
        title: 'Alert',
        middleText: 'gagal reset password',
      );
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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    Get.offAllNamed(Routes.HOME);
    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    Get.offAllNamed(Routes.HOME);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  verifyPhone(String nomor) async {
    await auth.verifyPhoneNumber(
        phoneNumber: '+62$nomor',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            if (value.user != null) {
              Get.toNamed(Routes.HOME);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.defaultDialog(
            title: 'Alert',
            middleText: 'gagal mengirim SMS',
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationCode = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationCode = verificationId;
        },
        timeout: Duration(seconds: 60));

    Get.toNamed(Routes.OTP_VERIFICATION, parameters: {"phone": nomor});
  }

  checkOTP(String kodeSMS) async {
    try {
      await auth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationCode, smsCode: kodeSMS))
          .then((value) {
        if (value.user != null) {
          Get.toNamed(Routes.HOME);
        }
      });
    } catch (err) {
      Get.defaultDialog(
        title: 'Alert',
        middleText: 'Kode verifikasi salah',
      );
    }
  }
}
