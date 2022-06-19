import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'authentication_services.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference users = firestore.collection("users");
FirebaseStorage _storage = FirebaseStorage.instance;

class UserServices {
  static Future addUser(
      String name, String email) async {
    await users.add({
      'name': name,
      'email': email,
      'imageFile': "https://firebasestorage.googleapis.com/v0/b/resepkub19.appspot.com/o/files%2Fwoman.png?alt=media&token=f228cc05-bb9f-4864-a16c-67e3dcfc4543",
    });
  }

  static Future<String> getUserIdDoc() {
    final email = AuthServices.getCurrentEmail();

    var userIdDoc = users.where("email", isEqualTo: email).get().then((value) {
      return value.docs[0].id;
    });

    return userIdDoc;
  }

  static Future updateProfileWithImage(String id, String name, XFile? imageFile) async {
    String? fileName = imageFile?.name;
    String? filePath = imageFile?.path;
    Reference storageRef = _storage.ref("$fileName.png");
    final path = 'files/${imageFile!.name}';
    final file = File(imageFile.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});

    final photoUrl = await snapshot.ref.getDownloadURL();

    users.doc(id).update({
      'name': name,
      'imageFile': photoUrl,
    });
  }

  static Future updateProfile(String id, String name) async {
    users.doc(id).update({
      'name': name,
    });
  }
}
