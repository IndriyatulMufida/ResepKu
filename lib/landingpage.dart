import 'package:flutter/material.dart';
import 'package:resepku/login.dart';
import 'package:get/get.dart';

class LandingPage1 extends StatelessWidget {
  const LandingPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 229, 100),
      body: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/images/landing-page1.png',
              width: 300,
              height: 300,
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Container(
            margin: EdgeInsets.only(left: 17),
            width: 250,
            height: 80,
            child: Text(
              "COOK LIKE A CHEF",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontFamily: 'PoppinsExtraBold',
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 50),
            width: 280,
            height: 80,
            child: Text(
              "Cook Profesional dishes right in your kitchen",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 140),
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: Color(0xFF7E57C2),
                  borderRadius: BorderRadius.all(Radius.circular(52)),
                ),
                alignment: Alignment.center,
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  ),
                  onPressed: () => Get.to(LandingPage2()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LandingPage2 extends StatelessWidget {
  const LandingPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 229, 100),
      body: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/images/landing-page2.png',
              width: 300,
              height: 300,
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Container(
            margin: EdgeInsets.only(left: 17),
            width: 250,
            height: 80,
            child: Text(
              "SPECIAL EXPERIENCE",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontFamily: 'PoppinsExtraBold',
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 50),
            width: 280,
            height: 80,
            child: Text(
              "Explore our new tasty foods",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 70),
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.navigate_before,
                    color: Colors.black,
                  ),
                  onPressed: () => Get.to(LandingPage1()),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: Color(0xFF7E57C2),
                  borderRadius: BorderRadius.all(Radius.circular(52)),
                ),
                alignment: Alignment.center,
                child: Text(
                  '2',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.navigate_next,
                    color: Colors.black,
                  ),
                  onPressed: () => Get.to(LandingPage3()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LandingPage3 extends StatelessWidget {
  const LandingPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 229, 100),
      body: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/images/landing-page3.png',
              width: 300,
              height: 300,
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Container(
            margin: EdgeInsets.only(left: 17),
            width: 250,
            height: 40,
            child: Text(
              "EASY AND FUN",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                fontFamily: 'PoppinsExtraBold',
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 50),
            width: 280,
            height: 80,
            child: Text(
              "It's easy and fun for cook!\nTry and collaborate in resepku",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 50),
                child: IconButton(
                  iconSize: 30,
                  icon: Icon(
                    Icons.navigate_before,
                    color: Colors.black,
                  ),
                  onPressed: () => Get.to(LandingPage2()),
                ),
              ),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color(0xFF7E57C2),
                    borderRadius: BorderRadius.all(Radius.circular(42)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onTap: () => Get.offAll(LoginPage()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
