import 'package:flutter/material.dart';
import 'package:resepku/detailresep.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ResepPopuler extends StatelessWidget {
  const ResepPopuler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference resep = firestore.collection("resep");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Semua Menu',
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
            stream: resep.where('status', isNotEqualTo: "Private").snapshots(),
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
                                  imageFile: e.get("imageFile"),
                                ));
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
                                                fontSize: 12,
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
