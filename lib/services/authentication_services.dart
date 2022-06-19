import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future createUser(String email, String pass) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "Akun anda berhasil di daftarkan",
        middleTextStyle: TextStyle(
          fontFamily: "'Poppins",
        ),
        onConfirm: () {
          Get.back();
          Get.back();
        },
        radius: 30,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        middleTextStyle: TextStyle(
          fontFamily: "'Poppins",
        ),
        radius: 30,
      );
      return false;
    } catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        radius: 30,
      );
      return false;
    }
  }

  static Future signInWithEmail(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        middleTextStyle: TextStyle(
          fontFamily: "Poppins",
        ),
        radius: 30,
      );
      return false;
    } catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        radius: 30,
      );
      return false;
    }
  }

  static Future resetPasswordWithEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email,
      );
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "Silahkan cek email anda untuk reset password",
        middleTextStyle: TextStyle(
          fontFamily: "'Poppins",
        ),
        onConfirm: () {
          Get.back();
          Get.back();
        },
        radius: 30,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        middleTextStyle: TextStyle(
          fontFamily: "Poppins",
        ),
        radius: 30,
      );
      return false;
    } catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        radius: 30,
      );
      return false;
    }
  }

  static Future changePassword(String oldPass, String newPass) async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        await _auth
            .signInWithEmailAndPassword(
          email: user.email.toString(),
          password: oldPass,
        )
            .then((dataCredential) {
          dataCredential.user?.updatePassword(newPass);
        });
      }
      return true;
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        middleTextStyle: TextStyle(
          fontFamily: "Poppins",
        ),
        radius: 30,
      );
      return false;
    } catch (e) {
      Get.defaultDialog(
        backgroundColor: Colors.white,
        middleText: "$e",
        radius: 30,
      );
      return false;
    }
  }

  static getCurrentEmail() {
    final user = _auth.currentUser;

    if (user != null) {
      final emailUser = user.email;
      return emailUser;
    }

    return false;
  }

  static getCurrentUser() {
    final user = _auth.currentUser;

    if(user != null) {
      return true;
    }
    
    return false;
  }

  static signOut() {
    _auth.signOut();
  }
}
