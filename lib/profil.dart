import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepku/edit_password.dart';
import 'package:resepku/edit_profil.dart';
import '../services/user_services.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var idDoc = UserServices.getUserIdDoc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Profil",
              style: TextStyle(
                  fontSize: 15, fontFamily: 'Poppins', color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 252, 101),
      ),
      body: SafeArea(
          child: FutureBuilder<String>(
        future: idDoc,
        builder: (_, AsyncSnapshot<String> _snapshot) {
          return (_snapshot.hasData)
              ? FutureBuilder<DocumentSnapshot>(
                  future: users.doc(_snapshot.data.toString()).get(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100,
                                    color: Color.fromARGB(255, 255, 252, 101),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 30,
                                                margin: EdgeInsets.only(
                                                    top: 10, left: 20),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Color.fromARGB(
                                                            255, 255, 252, 101)
                                                        .withOpacity(0.8)),
                                                child: Text(
                                                  "Profile",
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 260,
                                                height: 60,
                                                margin: EdgeInsets.only(
                                                    left: 10, top: 20),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Color.fromARGB(
                                                            255, 255, 252, 101)
                                                        .withOpacity(0.8)),
                                                child: Row(
                                                  children: <Widget>[
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      snapshot.data!
                                                          .get("name"),
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: <Widget>[
                                              const SizedBox(width: 8),
                                              Container(
                                                width: 260,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    color: Color.fromARGB(
                                                            255, 255, 252, 101)
                                                        .withOpacity(0.8)),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      snapshot.data!
                                                          .get("email"),
                                                      style: TextStyle(
                                                        fontFamily: "Poppins",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Get.to(EditProfile(
                                                      id: snapshot.data!.id,
                                                      name: snapshot.data!
                                                          .get("name"),
                                                      email: snapshot.data!
                                                          .get("email")));
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  size: 24.0,
                                                  color: Colors.black,
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 255, 252, 101),
                                                  ),
                                                  padding:
                                                      MaterialStateProperty.all(
                                                    EdgeInsets.symmetric(
                                                      horizontal: 15.0,
                                                      vertical: 8.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              //
                                              SizedBox(
                                                width: 8.0,
                                              ),
                                              //
                                              ElevatedButton(
                                                onPressed: () {
                                                  Get.to(EditPass());
                                                },
                                                child: Icon(
                                                  Icons.edit_road,
                                                  size: 24.0,
                                                  color: Colors.black,
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                    Color.fromARGB(
                                                        255, 255, 252, 101),
                                                  ),
                                                  padding:
                                                      MaterialStateProperty.all(
                                                    EdgeInsets.symmetric(
                                                      horizontal: 15.0,
                                                      vertical: 8.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8.0,
                                              ),
                                              //
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                left: MediaQuery.of(context).size.width * 0.15,
                                top: MediaQuery.of(context).size.height * 0.098,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      Color.fromARGB(255, 226, 225, 225),
                                  child: Padding(
                                    padding: EdgeInsets.all(2),
                                    child: ClipOval(
                                        child: Image.network(
                                      snapshot.data!.get('imageFile'),
                                      height: 50,
                                      width: 50,
                                    )),
                                  ),
                                ),
                              )
                            ],
                          )
                        : Text("Loading ...");
                  },
                )
              : Text("Loading ...");
        },
      )),
    );
  }
}
