import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepku/landingpage.dart';
import 'package:resepku/mainpage.dart';
import 'package:resepku/services/authentication_services.dart';

enum Jenis { Sarapan, Makansiang }

class RadioController extends GetxController {
  var jenis = Jenis.Sarapan.obs;
  onChanged(value) {
    jenis(value);
  }
}

class CheckBoxController extends GetxController {
  var isPublish = false.obs;
  setValue(newValue) => isPublish(newValue!);
}

class SwitchController extends GetxController {
  var switchValue = false.obs;
}

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 5), () {
      var currentUser = AuthServices.getCurrentUser();
      if(currentUser) {
        Get.off(MainPage());
      } else {
        Get.off(LandingPage1());
      }
    }
    );
  }
}


class TextController extends GetxController {
  final judulResepEditingController = TextEditingController();
  final deskripsiResepEditingController = TextEditingController();
  final waktuPenyajianEditingController = TextEditingController();
  final bahanEditingController = TextEditingController();
  final alatEditingController = TextEditingController();
  final tutorialEditingController = TextEditingController();
  final cariEditingController = TextEditingController();

  Rx judulResep = RxString("");
  Rx deksripsiResep = RxString("");
  Rx waktuPenyajian = RxString("");
  Rx bahan = RxString("");
  Rx alat = RxString("");
  Rx tutorial = RxString("");
  Rx cari = RxString("");

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  @override
  void onPressed() {
    judulResep.value = judulResepEditingController.text;
    deksripsiResep.value = deskripsiResepEditingController.text;
    waktuPenyajian.value = waktuPenyajianEditingController.text;
    bahan.value = bahanEditingController.text;
    alat.value = alatEditingController.text;
    tutorial.value = tutorialEditingController.text;
  }
}
