import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepku/services/authentication_services.dart';
import 'package:resepku/validator/validator.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}


class _ResetPasswordState extends State<ResetPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
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
                height: 50,
                child: Text(
                  "Reset Password ",
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
                  controller: _emailController,
                  //controller: textController.namaLengkapCtrl,
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
                    var validator = ResetPasswordValidator(
                      _emailController.value.text,
                    );
                    if (validator) {
                      validator = await AuthServices.resetPasswordWithEmail(
                          _emailController.value.text);
                    }
                  },
                  child: const Text(
                    "Reset",
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
