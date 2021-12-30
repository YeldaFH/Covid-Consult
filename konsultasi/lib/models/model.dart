class Consultation {
  late int id;
  late int idDokter;
  late String namaDokter;
  late String hariKonsultasi;
  late String startKonsultasi;
  late String endKonsultasi;

  Consultation({
    required this.id,
    required this.idDokter,
    required this.namaDokter,
    required this.hariKonsultasi,
    required this.startKonsultasi,
    required this.endKonsultasi
  });

  factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
    id: json["pk"],
    idDokter: json["fields"]["dokter"],
    namaDokter: json["fields"]["nama_dokter"],
    hariKonsultasi: json["fields"]["hari_konsultasi"],
    startKonsultasi: json["fields"]["waktu_konsultasi_start"],
    endKonsultasi: json["fields"]["waktu_konsultasi_end"]
  );

  Map<String, dynamic> toJson() => {
    "pk": id,
    "dokter": idDokter,
    "nama_dokter": namaDokter,
    "hari_konsultasi": hariKonsultasi,
    "waktu_konsultasi_start": startKonsultasi,
    "waktu_konsultasi_end": endKonsultasi,
  };
}