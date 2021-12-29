
import 'dart:convert';

class Model {
  final String penulis;
  final String judul;
  final String isi;
  final String datetime;

  Model({required this.penulis,required this.judul,required this.isi,required this.datetime});

  factory Model.fromRawJson(String str) => Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        penulis: json["fields"]["penulis"],
        judul: json["fields"]["judul"],
        isi: json["fields"]["isi"],
        datetime: json["fields"]["datetime"]
      );

  Map<String, dynamic> toJson() => {
        "penulis": penulis,
        "judul": judul,
        "isi": isi,
        "datetime": datetime,
      };
}


