import 'package:flutter/material.dart';
import 'package:resepku/Controller.dart';
import 'package:resepku/detailresep.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CariResep extends StatefulWidget {
  @override
  State<CariResep> createState() => _CariResepState();
}

class _CariResepState extends State<CariResep> {
  final TextController tc = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference resep = firestore.collection("resep");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cari Resep',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 252, 101),
      ),
      backgroundColor: Color.fromARGB(255, 255, 252, 101),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Material(
                        color: Color.fromARGB(255, 255, 252, 101),
                        shadowColor: Color(0xffDDDADA),
                        child: TextField(
                          controller: tc.cariEditingController,
                          onChanged: (value) {
                            setState(() {
                              tc.cariEditingController.text;
                            });
                          },
                          cursorColor: Color.fromARGB(255, 0, 0, 0),
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.amber, width: 3.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.amber, width: 3.0),
                              ),
                              hintText: "Cari Resep Saya",
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Container(
                                child: Icon(Icons.search),
                              )),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: resep
                .where('judul', isEqualTo: tc.cariEditingController.text)
                .snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                Get.to(DetailResep(judul: e.get('judul'), deskripsi: e.get('deskripsi'), waktu: e.get('waktu'), bahan: e.get('bahan'), alat: e.get('alat'), tutorial: e.get('tutorial'), imageFile: e.get("imageFile"),));
                              },
                              child: Card(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
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
    );
  }
}
