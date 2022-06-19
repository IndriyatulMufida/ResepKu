import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResepServices {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static CollectionReference _resep = _firestore.collection("resep");
  static FirebaseStorage _storage = FirebaseStorage.instance;
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future addResep(XFile? imageFile, String judul, String deskripsi, String waktu, String bahan, String alat, String? tutorial, String jenis, String status) async {
    String? fileName = imageFile?.name;
    String? filePath = imageFile?.path;
    Reference storageRef = _storage.ref("$fileName.png");
    final path = 'files/${imageFile!.name}';
    final file = File(imageFile.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});

    final photoUrl = await snapshot.ref.getDownloadURL();

    _resep.add({
      'email': _auth.currentUser?.email,
      'imageFile': photoUrl,
      'judul': judul,
      'deskripsi': deskripsi,
      'waktu': waktu,
      'bahan': bahan,
      'alat': alat,
      'tutorial': tutorial,
      'jenis': jenis,
      'status': status,
    });
  }

  static Future updateResep(String id, String? judul, String? deskripsi, String? waktu, String? bahan, String? alat, String? tutorial, String? jenis, String? status) async {
    _resep.doc(id).update({
      'judul': judul,
      'deskripsi': deskripsi,
      'waktu': waktu,
      'bahan': bahan,
      'alat': alat,
      'tutorial': tutorial,
      'jenis': jenis,
      'status': status,
    });
  }

  static Future updateResepWithImage(String id, XFile? imageFile, String? judul, String? deskripsi, String? waktu, String? bahan, String? alat, String? tutorial, String? jenis, String? status) async {
    String? fileName = imageFile?.name;
    String? filePath = imageFile?.path;
    Reference storageRef = _storage.ref("$fileName.png");
    final path = 'files/${imageFile!.name}';
    final file = File(imageFile.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});

    final photoUrl = await snapshot.ref.getDownloadURL();

    _resep.doc(id).update({
      'imageFile': photoUrl,
      'judul': judul,
      'deskripsi': deskripsi,
      'waktu': waktu,
      'bahan': bahan,
      'alat': alat,
      'tutorial': tutorial,
      'jenis': jenis,
      'status': status,
    });
  }

  static Future deleteResep(String id) async {
    _resep.doc(id).delete();
  }
}
