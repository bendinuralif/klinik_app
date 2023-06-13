class Pasien {
  int? id;
  String no_rm;
  String nama;
  DateTime tanggalLahir;
  String nomorTelepon;
  String alamat;

  Pasien(
      {this.id,
      required this.no_rm,
      required this.nama,
      required this.tanggalLahir,
      required this.nomorTelepon,
      required this.alamat});

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        id: json["id"],
        no_rm: json["no_rm"],
        nama: json["nama"],
        tanggalLahir: DateTime.parse(json["tgl_lahir"]),
        nomorTelepon: json["no_telp"],
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "no_rm": no_rm,
        "nama": nama,
        "tgl_lahir": tanggalLahir.toIso8601String(),
        "no_telp": nomorTelepon,
        "alamat": alamat
      };
}