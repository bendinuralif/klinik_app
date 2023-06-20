class Pegawai {
  int? id;
  String nip;
  String nama;
  DateTime tanggal_lahir;
  String nomor_telepon;
  String email;

  Pegawai(
      {this.id,
      required this.nip,
      required this.nama,
      required this.tanggal_lahir,
      required this.nomor_telepon,
      required this.email});

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
        id: json["id"],
        nip: json["nip"],
        nama: json["nama"],
        tanggal_lahir: DateTime.parse(json["tanggal_lahir"]),
        nomor_telepon: json["nomor_telepon"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama": nama,
        "tanggal_lahir": tanggal_lahir.toIso8601String(),
        "nomor_telepon": nomor_telepon,
        "email": email,
      };
}