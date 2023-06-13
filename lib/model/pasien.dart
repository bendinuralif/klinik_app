class Pasien {
  int? id;
  String nomor_rm;
  String nama;
  DateTime tanggal_lahir;
  String nomor_telepon;
  String alamat;

  Pasien(
      {this.id,
      required this.nomor_rm,
      required this.nama,
      required this.tanggal_lahir,
      required this.nomor_telepon,
      required this.alamat});

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        id: json["id"],
        nomor_rm: json["nomor_rm"],
        nama: json["nama"],
        tanggal_lahir: DateTime.parse(json["tanggal_lahir"]),
        nomor_telepon: json["nomor_telepon"],
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "nomor_rm": nomor_rm,
        "nama": nama,
        "tanggal_lahir": tanggal_lahir.toIso8601String(),
        "nomor_telepon": nomor_telepon,
        "alamat": alamat
      };
}