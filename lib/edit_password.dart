import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepku/login.dart';
import 'package:resepku/services/authentication_services.dart';

class EditPass extends StatefulWidget {
  const EditPass({Key? key}) : super(key: key);

  @override
  State<EditPass> createState() => _EditPassState();
}

class _EditPassState extends State<EditPass> {
  final _passwordLama = TextEditingController();
  final _passwordBaru = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Edit Password",
              style: TextStyle(
                  fontSize: 15, fontFamily: 'Poppins', color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 252, 101),
      ),
      body: ListView(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 1.1,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Password Lama",
                        style: TextStyle(fontFamily: "Poppins"),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 252, 101),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: TextField(
                            controller: _passwordLama,
                            maxLines: 1,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password Lama",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w300),
                              border: InputBorder.none,
                              suffixIcon: const SizedBox(),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Password Baru",
                        style: TextStyle(fontFamily: "Poppins"),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 252, 101),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: TextField(
                            controller: _passwordBaru,
                            maxLines: 1,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password Baru",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w300),
                              border: InputBorder.none,
                              suffixIcon: const SizedBox(),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        width: 150,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                            var check = await AuthServices.changePassword(
                                    _passwordLama.text, _passwordBaru.text)
                                .then((value) => value);

                            if (check) Get.back();
                          },
                          child: Text(
                            'Simpan',
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: Color.fromARGB(255, 255, 252, 101),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
