// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepku/services/authentication_services.dart';
import 'package:resepku/services/user_services.dart';
import 'package:resepku/validator/validator.dart';

bool? agree = false;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

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
                margin: EdgeInsets.only(top: 40, left: 20),
                width: lebar,
                height: 20,
                child: Text(
                  "Start For Free",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: lebar,
                height: 50,
                child: Text(
                  "Sign Up To Resepku ",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: _nameController,
                  //controller: textController.namaLengkapCtrl,
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: Color(0xFFFAC213),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: " Nama ",
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
                  controller: _emailController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    fillColor: Color(0xFFFAC213),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    labelText: " Email ",
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
                  controller: _passController,
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
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              CheckBox(),
              SizedBox(
                height: 20,
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
                    var validator = SignUpValidator(
                      _nameController.value.text,
                      _emailController.value.text,
                      _passController.value.text,
                      agree,
                    );
                    if (validator) {
                      validator = await AuthServices.createUser(
                          _emailController.value.text,
                          _passController.value.text);
                      if (validator) {
                        await UserServices.addUser(
                          _nameController.value.text,
                          _emailController.value.text,
                        );
                      }
                    }
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 60, right: 5),
                    width: 160,
                    height: 20,
                    child: Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  GestureDetector(
                    child: Text("Login",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF7E57C2),
                            fontFamily: 'Poppins')),
                    onTap: () => Get.back(),
                    // do what you need to do when "Click here" gets clicked
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 35,
            height: 35,
            margin: EdgeInsets.only(right: 5, left: 20),
            child: Checkbox(
                value: agree,
                onChanged: (bool? value) {
                  setState(() {
                    agree = value;
                  });
                })),
        Text(
          'i agree to all the Term and Privacy Policy ',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins',
          ),
        ), //Text
      ],
    );
  }
}
