import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepku/mainpage.dart';
import 'package:resepku/register.dart';
import 'package:resepku/resetpassword.dart';
import 'package:resepku/services/authentication_services.dart';
import 'package:resepku/services/user_services.dart';
import 'package:resepku/validator/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, left: 17),
                width: lebar,
                height: 40,
                child: Text(
                  "Glad to see you!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: lebar,
                height: 50,
                child: Text(
                  "Sign to your account and get started \nto easily your cooking ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: _emailController,
                  //controller: textController.namaLengkapCtrl,
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: Color(0xFFFAC213),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: " Email",
                    labelStyle: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  obscureText: _isHidePassword,
                  autofocus: false,
                  controller: _passwordController,
                  //controller: textController.namaLengkapCtrl,
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(
                          _isHidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: _isHidePassword ? Colors.grey : Colors.blue,
                        ),
                        onPressed: () {
                          _togglePasswordVisibility();
                        }),
                    fillColor: Color(0xFFFAC213),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),

                    //hintText: 'enter your email or phone number',
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: lebar,
                height: 40,
                margin: EdgeInsets.only(left: 40, right: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFE664),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(40),
                      )),
                  onPressed: () async {
                    var validator = LogInValidator(_emailController.value.text,
                        _passwordController.value.text);
                    if (validator) {
                      validator = await AuthServices.signInWithEmail(
                          _emailController.value.text,
                          _passwordController.value.text);
                      Get.off(MainPage());
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    width: 150,
                    height: 20,
                    child: Text(
                      "Dont have an account?  ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Text("Sign-Up",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF7E57C2),
                          fontFamily: 'Poppins',
                        )),
                    onTap: () => Get.to(Register()),
                    // do what you need to do when "Click here" gets clicked
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    width: 150,
                    height: 20,
                    child: Text(
                      "Forgot Password?  ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Text("Reset Password",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xFF7E57C2),
                          fontFamily: 'Poppins',
                        )),
                    onTap: () => Get.to(ResetPassword()),
                    // do what you need to do when "Click here" gets clicked
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
