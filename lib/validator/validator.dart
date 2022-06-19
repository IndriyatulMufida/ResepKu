import 'package:flutter/material.dart';
import 'package:get/get.dart';

SignUpValidator(name, email, password, agree) {
  if (name.isEmpty || email.isEmpty || password.isEmpty || !agree) {
    Get.snackbar('Gagal', 'Form Tidak Boleh Kosong',
        titleText: Text(
          "Gagal",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        messageText: Text(
          "Form Tidak Boleh Kosong!",
          style: TextStyle(
              fontFamily: "Poppins", color: Color.fromARGB(255, 0, 0, 0)),
        ),
        icon: Icon(
          Icons.warning,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        backgroundColor: Color(0xFFFFE664),
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(15),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack);
    return false;
  } else {
    return true;
  }
}

LogInValidator(email, password) {
  if (email.isEmpty || password.isEmpty) {
    Get.snackbar('Gagal', 'Form Tidak Boleh Kosong!',
        titleText: Text(
          "Gagal",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        messageText: Text(
          "Form Tidak Boleh kosong!",
          style: TextStyle(
              fontFamily: "Poppins", color: Color.fromARGB(255, 0, 0, 0)),
        ),
        icon: Icon(
          Icons.warning,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        backgroundColor: Color(0xFFFFE664),
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(15),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack);
    return false;
  } else {
    return true;
  }
}

ResetPasswordValidator(email) {
  if (email.isEmpty) {
    Get.snackbar('Gagal', 'Form Tidak Boleh Kosong',
        titleText: Text(
          "Gagal",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        messageText: Text(
          "Form Tidak Boleh Kosong!",
          style: TextStyle(
              fontFamily: "Poppins", color: Color.fromARGB(255, 0, 0, 0)),
        ),
        icon: Icon(
          Icons.warning,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        backgroundColor: Color(0xFFFFE664),
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(15),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack);
    return false;
  } else {
    return true;
  }
}

TambahResepUser(imageFile, judul, deskripsi, waktu, bahan, alat, tutorial) {
  if (imageFile.isEmpty || judul.isEmpty || deskripsi.isEmpty || waktu.isEmpty || bahan.isEmpty || alat.isEmpty || tutorial.isEmpty) {
    Get.snackbar('Gagal', 'Form Tidak Boleh Kosong',
        titleText: Text(
          "Gagal",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        messageText: Text(
          "Form Tidak Boleh Kosong!",
          style: TextStyle(
              fontFamily: "Poppins", color: Color.fromARGB(255, 0, 0, 0)),
        ),
        icon: Icon(
          Icons.warning,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        backgroundColor: Color(0xFFFFE664),
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(15),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack);
    return false;
  } else {
    return true;
  }
}

EditResepUser(judul, deskripsi, waktu, bahan, alat, tutorial) {
  if (judul.isEmpty || deskripsi.isEmpty || waktu.isEmpty || bahan.isEmpty || alat.isEmpty || tutorial.isEmpty) {
    Get.snackbar('Gagal', 'Form Tidak Boleh Kosong',
        titleText: Text(
          "Gagal",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        messageText: Text(
          "Form Tidak Boleh Kosong!",
          style: TextStyle(
              fontFamily: "Poppins", color: Color.fromARGB(255, 0, 0, 0)),
        ),
        icon: Icon(
          Icons.warning,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        backgroundColor: Color(0xFFFFE664),
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(15),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack);
    return false;
  } else {
    return true;
  }
}

EditProfileUser(name) {
  if (name.isEmpty) {
    Get.snackbar('Gagal', 'Form Tidak Boleh Kosong',
        titleText: Text(
          "Gagal",
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0)),
        ),
        messageText: Text(
          "Form Tidak Boleh Kosong!",
          style: TextStyle(
              fontFamily: "Poppins", color: Color.fromARGB(255, 0, 0, 0)),
        ),
        icon: Icon(
          Icons.warning,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        backgroundColor: Color(0xFFFFE664),
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(15),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack);
    return false;
  } else {
    return true;
  }
}
