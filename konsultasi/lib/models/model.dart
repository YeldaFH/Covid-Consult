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


class Profile {
  late int id;
  late String user;
  late String name;
  late String dob;
  late String email;
  late String gender;
  late String phoneNum;
  late String role;
  late String profilColor;

  Profile({
    required this.id,
    required this.user,
    required this.name,
    required this.dob,
    required this.email,
    required this.gender,
    required this.phoneNum,
    required this.role,
    required this.profilColor
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["pk"],
    user: json["fields"]["user"],
    name: json["fields"]["name"],
    dob: json["fields"]["dob"],
    email: json["fields"]["email"],
    gender: json["fields"]["gender"],
    phoneNum: json["fields"]["phone_num"],
    role: json["fields"]["role"],
    profilColor: json["fields"]["profil_color"]
  );

  Map<String, dynamic> toJson() => {
    "pk": id,
    "user": user,
    "name": name,
    "dob": dob,
    "email": email,
    "gender": gender,
    "phone_num": phoneNum,
    "role": role,
    "profil_color": profilColor
  };
}


class Booking {
  late int id;
  late int dokter;
  late String namaDokter;
  late String hariKonsultasi;
  late String namaPasien;
  late String nomorHandphone;
  late String email;

  Booking ({
    required this.id,
    required this.dokter,
    required this.namaDokter,
    required this.hariKonsultasi,
    required this.namaPasien,
    required this.nomorHandphone,
    required this.email
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json["pk"],
    dokter: json["fields"]["dokter"],
    namaDokter: json["fields"]["nama_dokter"],
    hariKonsultasi: json["fields"]["hari_konsultasi"],
    namaPasien: json["fields"]["nama_pasien"],
    nomorHandphone: json["fields"]["nomor_handphone"],
    email: json["fields"]["email"]
  );

  Map<String, dynamic> toJson() => {
    "pk": id,
    "dokter": dokter,
    "nama_dokter": namaDokter,
    "hari_konsultasi": hariKonsultasi,
    "nama_pasien": namaPasien,
    "nomor_handphone": nomorHandphone,
    "email": email
  };
}