// ignore_for_file: unnecessary_overrides, unused_import, avoid_print, prefer_const_constructors, unused_local_variable, unused_catch_clause, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

class SliderController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  addData(bool aktifSlider, String deskSlider, String gambarSlider) async {
    CollectionReference slider = firestore.collection('slider');

    final sliderData = {
      "aktifSlider": aktifSlider,
      "deskSlider": deskSlider,
      "gambarSlider": gambarSlider
    };

// Add a new document with a generated ID
    try {
      await slider.add(sliderData).then((DocumentReference doc) {
        print('DocumentSnapshot added with ID: ${doc.id}');
        Get.defaultDialog(title: 'Alert', middleText: 'berhasil menambah data');
        Get.offNamed(Routes.SLIDER_DATA);
      });
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal menambah data');
    }
  }

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference slider = firestore.collection('slider');

    return await slider.get();
  }

  updateData(String id, bool activeSlider, String deskSlider,
      String gambarSlider) async {
    try {
      final sliderData = {
        "aktifSlider": activeSlider,
        "deskSlider": deskSlider,
        "gambarSlider": gambarSlider
      };

      DocumentReference Slider = firestore.collection('slider').doc(id);
      await Slider.update(sliderData);

      Get.defaultDialog(title: 'Alert', middleText: 'berhasil menupdate data');
      Get.offNamed(Routes.SLIDER_DATA);
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal menupdate data');
      print(e);
    }
  }

  deleteData(String id) async {
    try {
      DocumentReference Slider = firestore.collection('slider').doc(id);
      await Slider.delete();
      Get.defaultDialog(title: 'Alert', middleText: 'berhasil mendelete data');
      return Get.offAllNamed(Routes.SLIDER_DATA);
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal mendelete data');
      print(e);
    }
  }
}
