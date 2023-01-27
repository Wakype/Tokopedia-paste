// ignore_for_file: unnecessary_overrides, unused_import, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
