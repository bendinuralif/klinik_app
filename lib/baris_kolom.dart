import 'package:flutter/material.dart';

class BarisKolom extends StatelessWidget {
  const BarisKolom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Baris Kolom Tegar"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(children: const [
            Text("Baris 1, Kolom 1 ,"),
            Text("Baris 1, Kolom 2 ,"),
            Text("Baris 1, Kolom 3 ,"),
            Text("Baris 1, Kolom 4 ")
          ]),
          Row(children: const [
            Text("Baris 2, Kolom 1 ,"),
            Text("Baris 2, Kolom 2 ,"),
            Text("Baris 2, Kolom 3 ,"),
            Text("Baris 2, Kolom 4")
          ]),
          Row(children: const [
            Text("Baris 3, Kolom 1 ,"),
            Text("Baris 3, Kolom 2 ,"),
            Text("Baris 3, Kolom 3 ,"),
            Text("Baris 3, Kolom 4")
          ])
        ],
      ),
    );
  }
}