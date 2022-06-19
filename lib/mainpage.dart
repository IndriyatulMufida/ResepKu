import 'package:flutter/material.dart';
import 'package:resepku/cariresep.dart';
import 'package:resepku/detailresep.dart';
import 'package:resepku/login.dart';
import 'package:resepku/profil.dart';
import 'package:resepku/resepmakanberat.dart';
import 'package:resepku/semuamenu.dart';
import 'package:resepku/resepsarapan.dart';
import 'package:resepku/resepsaya.dart';
import 'package:resepku/services/authentication_services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference resep = firestore.collection("resep");

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Halaman Utama',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(ProfilePage());
              },
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 252, 101),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 255, 252, 101),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Text('ResepKu',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  )),
            ),
            ListTile(
              title: const Text('Resep Saya',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  )),
              onTap: () {
                Get.to(ResepSaya());
              },
            ),
            ListTile(
              title: const Text('Cari Resep',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  )),
              onTap: () {
                Get.to(CariResep());
              },
            ),
            ListTile(
              title: const Text('Semua Menu',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  )),
              onTap: () {
                Get.to(ResepPopuler());
              },
            ),
            ListTile(
              title: const Text('Menu Sarapan',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  )),
              onTap: () {
                Get.to(ResepSarapan());
              },
            ),
            ListTile(
              title: const Text('Menu Makan Berat',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  )),
              onTap: () {
                Get.to(ResepMakanSiang());
              },
            ),
            ListTile(
              title: const Text('Logout',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  )),
              onTap: () {
                AuthServices.signOut();
                Get.off(LoginPage());
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Masak dirumah bersama Resepku \nyang selalu ada",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "SEMUA MENU",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: resep
                    .where('status', isNotEqualTo: "Private")
                    .limit(4)
                    .snapshots(),
                builder: (_, snapshot) {
                  return (snapshot.hasData)
                      ? Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    Get.to(DetailResep(
                                        judul: e.get('judul'),
                                        deskripsi: e.get('deskripsi'),
                                        waktu: e.get('waktu'),
                                        bahan: e.get('bahan'),
                                        alat: e.get('alat'),
                                        tutorial: e.get('tutorial'),
                                        imageFile: e.get('imageFile')));
                                  },
                                  child: Card(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.network(
                                              e.get("imageFile"),
                                              width: 150,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(e.get('judul'),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11,
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins')),
                                            Text(
                                              "${e.get('waktu')}",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 9),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      : Text('Loading...');
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "MENU SARAPAN",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: resep
                    .where('status', isEqualTo: "Publish")
                    .where('jenis', isEqualTo: "Sarapan")
                    .limit(4)
                    .snapshots(),
                builder: (_, snapshot) {
                  return (snapshot.hasData)
                      ? Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    Get.to(DetailResep(
                                        judul: e.get('judul'),
                                        deskripsi: e.get('deskripsi'),
                                        waktu: e.get('waktu'),
                                        bahan: e.get('bahan'),
                                        alat: e.get('alat'),
                                        tutorial: e.get('tutorial'),
                                        imageFile: e.get('imageFile')));
                                  },
                                  child: Card(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.network(
                                              e.get('imageFile'),
                                              width: 150,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(e.get('judul'),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11,
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins')),
                                            Text(
                                              "${e.get('waktu')}",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      : Text('Loading...');
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "MENU MAKAN BERAT",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: resep
                    .where('status', isEqualTo: "Publish")
                    .where('jenis', isEqualTo: "Makan Berat")
                    .limit(4)
                    .snapshots(),
                builder: (_, snapshot) {
                  return (snapshot.hasData)
                      ? Column(
                          children: snapshot.data!.docs
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    Get.to(DetailResep(
                                        judul: e.get('judul'),
                                        deskripsi: e.get('deskripsi'),
                                        waktu: e.get('waktu'),
                                        bahan: e.get('bahan'),
                                        alat: e.get('alat'),
                                        tutorial: e.get('tutorial'),
                                        imageFile: e.get('imageFile')));
                                  },
                                  child: Card(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.network(
                                              e.get('imageFile'),
                                              width: 150,
                                              height: 150,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(e.get('judul'),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontFamily: 'Poppins')),
                                            Text(
                                              "${e.get('waktu')}",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 13),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      : Text('Loading...');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
