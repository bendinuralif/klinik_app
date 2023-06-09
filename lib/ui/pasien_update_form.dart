import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../ui/pasien_detail.dart';
import '../service/pasien_service.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);
  _PasienUpdateFormState createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPasienCtrl = TextEditingController();
  final _nIPCtrl = TextEditingController();
  final _tanggal_lahirCtrl = TextEditingController();
  final _nomor_teleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  Future<Pasien> getData() async {
    Pasien data = await PasienService().getById(widget.pasien.id.toString());
    setState(() {
      if (data.nomor_rm != null) {
        _nIPCtrl.text = data.nomor_rm;
      }
      if (data.nama != null) {
        _namaPasienCtrl.text = data.nama;
      }
      if (data.tanggal_lahir != null) {
        final formattedDate =
            "${data.tanggal_lahir.year}-${data.tanggal_lahir.month.toString().padLeft(2, '0')}-${data.tanggal_lahir.day.toString().padLeft(2, '0')}";
        _tanggal_lahirCtrl.text = formattedDate;
      }
      if (data.nomor_telepon != null) {
        _nomor_teleponCtrl.text = data.nomor_telepon;
      }
      if (data.alamat != null) {
        _emailCtrl.text = data.alamat;
      }
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pasien")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNamaPasien(),
                _fieldNIP(),
                _fieldTangalLahir(),
                _fieldnomor_telepon(),
                _fieldEmail(),
                _fieldPassword(),
                const SizedBox(height: 20),
                _tombolSimpan()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _fieldNamaPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pasien"),
      controller: _namaPasienCtrl,
    );
  }

  _fieldNIP() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIP"),
      controller: _nIPCtrl,
    );
  }

  _fieldTangalLahir() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir"),
      controller: _tanggal_lahirCtrl,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              final formattedDate =
                  "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
              _tanggal_lahirCtrl.text = formattedDate;
            });
          }
        });
      },
      readOnly: true,
    );
  }

  _fieldnomor_telepon() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
      controller: _nomor_teleponCtrl,
    );
  }

  _fieldEmail() {
    return TextField(
      decoration: const InputDecoration(labelText: "Email"),
      controller: _emailCtrl,
    );
  }

  _fieldPassword() {
    return TextField(
      decoration: const InputDecoration(labelText: "Password"),
      controller: _passwordCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Pasien pasien = new Pasien(
            nomor_rm: _nIPCtrl.text,
            nama: _namaPasienCtrl.text,
            tanggal_lahir: DateTime.parse(_tanggal_lahirCtrl.text),
            nomor_telepon: _nomor_teleponCtrl.text,
            alamat: _emailCtrl.text);
        String id = widget.pasien.id.toString();
        await PasienService().ubah(pasien, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PasienDetail(pasien: value),
            ),
          );
        });
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}