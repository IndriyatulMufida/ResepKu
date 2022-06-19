import 'package:flutter/material.dart';

class DetailResep extends StatelessWidget {
  DetailResep({
    Key? key,
    required this.judul,
    required this.deskripsi,
    required this.waktu,
    required this.bahan,
    required this.alat,
    required this.tutorial,
    required this.imageFile,
  }) : super(key: key);

  final String judul, deskripsi, waktu, bahan, alat, tutorial, imageFile;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          judul,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 252, 101),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Image.network(
                imageFile,
                //width: 400,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              judul,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                  fontFamily: 'Poppins'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, top: 10),
            child: Text(
              deskripsi,
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 16),
            child: Text(
              'Waktu Penyajian: ${waktu}',
              style: TextStyle(fontFamily: 'Poppins'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Bahan : \n' + bahan,
              style: TextStyle(
                  fontSize: 16, color: Colors.brown, fontFamily: 'Poppins'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Alat : \n' + alat,
              style: TextStyle(
                  fontSize: 16, color: Colors.brown, fontFamily: 'Poppins'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Tutorial : \n' + tutorial,
              style: TextStyle(
                  fontSize: 16, color: Colors.brown, fontFamily: 'Poppins'),
            ),
          ),
        ],
      ),
    );
  }
}
