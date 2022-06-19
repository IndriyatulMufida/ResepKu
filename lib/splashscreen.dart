import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepku/Controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashScreenController spc = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    var mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 252, 101),
      body: Center(
        child: Image.asset(
          'assets/images/Logo-Splashscreen.png',
          width: mediaQueryWidth / 2,
        ),
      ),
    );
  }
}
