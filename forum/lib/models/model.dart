class Post {
  late int id;
  late String judul;
  late String kategori;
  late String isi;
  late String dateTime;
  late String warna;
  late String namaPenulis;
  late int penulis;
  late String strings;

  Post({
      required this.id,
      required this.judul,
      required this.kategori,
      required this.isi,
      required this.dateTime,
      required this.warna,
      required this.namaPenulis,
      required this.penulis,
      required this.strings
      });
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["pk"],
        judul: json["fields"]["judul"],
        kategori: json["fields"]["kategori"],
        isi: json["fields"]["isi"],
        penulis: json["fields"]["penulis"],
        dateTime: json["fields"]["DateTime"],
        warna: json["fields"]["warna"],
        strings: json["fields"]["strings"],
        namaPenulis: json["fields"]["namaPenulis"],
      );
  Map<String, dynamic> toJson() => {
        "pk": id,
        "judul": judul,
        "kategori": kategori,
        "isi": isi,
        "penulis": penulis,
        "DateTime": dateTime,
        "warna": warna,
        "strings": strings,
        "namaPenulis": namaPenulis,
      };
}

class Comment {
  late int id;
  late String isi;
  late int post;
  late String namaPenulis;
  late String dateTime;
  late String jumlahReply;
  late String warna;

  Comment({
    required this.id,
    required this.isi,
    required this.post,
    required this.namaPenulis,
    required this.dateTime,
    required this.jumlahReply,
    required this.warna,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["pk"],
        isi: json["fields"]["isi"],
        post: json["fields"]["post"],
        namaPenulis: json["fields"]["namaPenulis"],
        dateTime: json["fields"]["DateTime"],
        jumlahReply: json["fields"]["jumlahReply"],
        warna: json["fields"]["warna"],
      );

  Map<String, dynamic> toJson() => {
        "pk": id,
        "isi": isi,
        "post": post,
        "namaPenulis": namaPenulis,
        "DateTime": dateTime,
        "jumlahReply": jumlahReply,
        "warna": warna,
      };
}

class Reply {
  late String isi;
  late int komen;
  late String namaPenulis;
  late String dateTime;
  late String warna;

  Reply({
    required this.isi,
    required this.komen,
    required this.namaPenulis,
    required this.dateTime,
    required this.warna,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        isi: json["fields"]["isi"],
        komen: json["fields"]["komen"],
        namaPenulis: json["fields"]["namaPenulis"],
        dateTime: json["fields"]["DateTime"],
        warna: json["fields"]["warna"],
      );

  Map<String, dynamic> toJson() => {
        "isi": isi,
        "komen": komen,
        "namaPenulis": namaPenulis,
        "DateTime": dateTime,
        "warna": warna,
      };
}
