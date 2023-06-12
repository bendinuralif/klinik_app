class Pegawai {
  int? id;
  String namaPegawai;

  Pegawai({this.id, required this.namaPegawai});

  factory Pegawai.fromJson(Map<String, dynamic> json) =>
      Pegawai(id: json["id"], namaPegawai: json["nama_pegawai"]);

  Map<String, dynamic> toJson() => {"nama_poli": namaPegawai};
}
