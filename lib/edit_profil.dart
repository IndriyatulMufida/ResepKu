import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resepku/mainpage.dart';
import 'package:resepku/profil.dart';
import 'package:resepku/services/user_services.dart';
import 'package:resepku/validator/validator.dart';

class EditProfile extends StatefulWidget {
  EditProfile(
      {Key? key, required this.id, required this.name, required this.email})
      : super(key: key);

  final String id, name, email;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
  }

  String? fileName = "";
  XFile? file;

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.name;
    _emailController.text = widget.email;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Edit Profile",
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
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
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
                      "Name",
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
                          controller: _nameController,
                          maxLines: 1,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "Name",
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
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Email",
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
                          controller: _emailController,
                          maxLines: 1,
                          enabled: false,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "Email",
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
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                      child: Container(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        file = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        setState(() {
                          fileName = file?.name;
                        });
                      },
                      child: Text(
                        'Upload Image',
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
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, left: 20.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${fileName}",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          var validator = EditProfileUser(
                            _nameController.text,
                          );
                          if (validator) {
                            if (fileName != "") {
                              validator =
                                  await UserServices.updateProfileWithImage(
                                      widget.id, _nameController.text, file);
                            } else {
                              validator = await UserServices.updateProfile(
                                widget.id,
                                _nameController.text,
                              );
                            }
                            Get.back();
                            Get.back();
                            _nameController.text = "";
                            _emailController.text = "";
                          }
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
        ],
      ),
    );
  }
}
