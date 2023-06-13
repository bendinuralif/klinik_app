import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/pasien_detail.dart';
import '../model/pasien.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;
  const PasienItem({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text("${pasien.nama}"),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PasienDetail(pasien: pasien)));
      },
    );
  }
}