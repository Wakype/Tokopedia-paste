// ignore_for_file: unused_import, non_constant_identifier_names, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SliderController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String url = "";
  File? path;

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
    }
  }

  addPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      String namaFile = result.files.first.name;
      url = namaFile;
      path = file;

      try {
        await storage.ref("${namaFile}").putFile(file);
        final data = await storage.ref("${namaFile}").getDownloadURL();

        url = data;

        return url;
      } catch (e) {
        Get.defaultDialog(title: 'Alert', middleText: 'gagal menUpload file');
      }
    } else {
    }
  }
}
