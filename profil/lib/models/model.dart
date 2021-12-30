class Fields {
    Fields({
        required this.user,
        required this.name,
        required this.dob,
        required this.email,
        required this.gender,
        required this.phoneNum,
        required this.role,
        required this.profilColor,
    });

    int user;
    String name;
    String dob;
    String email;
    String gender;
    String phoneNum;
    String role;
    String profilColor;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["fields"]["user"],
        name: json["fields"]["name"],
        dob: json["fields"]["dob"],
        email: json["fields"]["email"],
        gender: json["fields"]["gender"],
        phoneNum: json["fields"]["phone_num"],
        role: json["fields"]["role"],
        profilColor: json["fields"]["profil_color"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "dob": dob,
        "email": email,
        "gender": gender,
        "phone_num": phoneNum,
        "role": role,
        "profil_color": profilColor,
    };
}
