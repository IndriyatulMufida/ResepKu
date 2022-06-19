import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resepku/Controller.dart';
import 'package:resepku/services/authentication_services.dart';
import 'package:resepku/services/resep_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resepku/services/user_services.dart';
import 'package:resepku/validator/validator.dart';

class TambahResep extends StatefulWidget {
  @override
  State<TambahResep> createState() => _TambahResepState();
}

class _TambahResepState extends State<TambahResep> {
  final TextController tc = Get.put(TextController());

  final CheckBoxController b = Get.put(CheckBoxController());

  final RadioController rc = Get.put(RadioController());

  getString(Jenis value) {
    if (value == Jenis.Sarapan) {
      return "Sarapan";
    } else {
      return "Makan Berat";
    }
  }

  String? fileName = "";

  XFile? file;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection("users");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Resep',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 252, 101),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/images/Logo-Landing.png'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0),
                alignment: Alignment.topLeft,
                child: StreamBuilder<QuerySnapshot>(
                  stream: users
                      .where('email', isEqualTo: AuthServices.getCurrentEmail())
                      .snapshots(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData) 
                      ? Text(
                      // NOTE: Tarik dari Users Data
                      'Halo, ${snapshot.data!.docs.first.get('name')}\nSilahkan tambahkan menu baru di bawah ini:)',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ) : Text('Loading...');
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: TextField(
                  controller: tc.judulResepEditingController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 3.0),
                      ),
                      labelText: "Judul Resep",
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: tc.deskripsiResepEditingController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 3.0),
                    ),
                    labelText: "Deskripsi singkat resep",
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: tc.waktuPenyajianEditingController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 3.0),
                    ),
                    labelText: "Waktu penyajian",
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  maxLines: 10,
                  controller: tc.bahanEditingController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 3.0),
                    ),
                    labelText: "Bahan",
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  maxLines: 10,
                  controller: tc.alatEditingController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 3.0),
                    ),
                    labelText: "Alat",
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: TextFormField(
                  maxLines: 10,
                  controller: tc.tutorialEditingController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 3.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber, width: 3.0),
                    ),
                    labelText: "Tutorial",
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Jenis Resep Anda?',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        "Sarapan",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      leading: Obx(
                        () => Radio<Jenis>(
                          groupValue: rc.jenis.value,
                          value: Jenis.Sarapan,
                          onChanged: (value) {
                            rc.jenis(value);
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text(
                        "Makan Berat",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      leading: Obx(
                        () => Radio<Jenis>(
                          groupValue: rc.jenis.value,
                          value: Jenis.Makansiang,
                          onChanged: (value) {
                            rc.jenis(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(
                    top: 20.0, left: 80.0, right: 80.0, bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                      )),
                  onPressed: () async {
                    file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    setState(() {
                      fileName = file!.name;
                    });
                  },
                  child: const Text(
                    'Upload Gambar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
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
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0),
                alignment: Alignment.topLeft,
                child: Text(
                  'Apakah resep anda ingin sekaligus di publish?',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Publish",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
                leading: Obx(() => Checkbox(
                      value: b.isPublish.value,
                      onChanged: (newValue) => b.setValue(newValue),
                    )),
              ),
            ],
          ),
          Container(
            height: 40,
            margin:
                EdgeInsets.only(top: 20.0, left: 80.0, right: 80.0, bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20),
                  )),
              onPressed: () async {
                var validator = TambahResepUser(
                  fileName,
                  tc.judulResepEditingController.text,
                  tc.deskripsiResepEditingController.text,
                  tc.waktuPenyajianEditingController.text,
                  tc.bahanEditingController.text,
                  tc.alatEditingController.text,
                  tc.tutorialEditingController.text,
                );

                if (validator) {
                  validator = await ResepServices.addResep(
                    file,
                    tc.judulResepEditingController.text,
                    tc.deskripsiResepEditingController.text,
                    tc.waktuPenyajianEditingController.text,
                    tc.bahanEditingController.text,
                    tc.alatEditingController.text,
                    tc.tutorialEditingController.text,
                    getString(rc.jenis.value),
                    b.isPublish.value ? "Publish" : "Private",
                  );
                  Get.back();
                  tc.judulResepEditingController.text = "";
                  tc.deskripsiResepEditingController.text = "";
                  tc.waktuPenyajianEditingController.text = "";
                  tc.bahanEditingController.text = "";
                  tc.alatEditingController.text = "";
                  tc.tutorialEditingController.text = "";
                  fileName = "";
                  b.isPublish.value = false;
                  final MySnackBar = Get.snackbar(
                    "Pesan",
                    "Anda Berhasil Submit",
                    animationDuration: Duration(seconds: 5),
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.all(8),
                  );
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
