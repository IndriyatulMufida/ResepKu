import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resepku/editresep.dart';
import 'package:resepku/Controller.dart';
import 'package:resepku/services/authentication_services.dart';
import 'package:resepku/services/resep_services.dart';
import 'package:resepku/tambahresep.dart';

class ResepSaya extends StatelessWidget {
  final TextController tc = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference resep = firestore.collection("resep");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resep Saya',
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
          StreamBuilder<QuerySnapshot>(
            stream:
              resep
                .where('email', isEqualTo: AuthServices.getCurrentEmail())
                .snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? Column(
                      children: snapshot.data!.docs
                          .map(
                            (e) => Card(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
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
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(EditResep(
                                                id: e.id,
                                                judul: e.get('judul'),
                                                deskripsi: e.get('deskripsi'),
                                                waktu: e.get('waktu'),
                                                bahan: e.get('bahan'),
                                                alat: e.get('alat'),
                                                tutorial: e.get('tutorial'),
                                                jenis: e.get('jenis'),
                                                status: e.get('status'),
                                              ));
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                  top: 25,
                                                  left: 0,
                                                ),
                                                child: Icon(Icons.edit)),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.defaultDialog(
                                                backgroundColor: Colors.white,
                                                middleText:
                                                    "Apakah anda yakin ingin menghapus resep ini?",
                                                middleTextStyle: TextStyle(
                                                  fontFamily: "'Poppins",
                                                ),
                                                onConfirm: () {
                                                  ResepServices.deleteResep(
                                                      e.id);
                                                  Get.back();
                                                },
                                                onCancel: () {},
                                                radius: 30,
                                              );
                                            },
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 25, left: 5),
                                                child: Icon(Icons.delete)),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TambahResep());
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
