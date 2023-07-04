class Siswa {
  String? id;
  String? nis;
  String? namaSiswa;
  String? kelas;

  Siswa({this.id, required this.nis, this.namaSiswa, this.kelas});

  factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
        id: json["id"],
        nis: json["nis"],
        namaSiswa: json["nama_siswa"],
        kelas: json["kelas"],
      );

  Map<String, dynamic> toJson() => {
        "nis": nis,
        "nama_siswa": namaSiswa,
        "kelas": kelas,
      };
}
