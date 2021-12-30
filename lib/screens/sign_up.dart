// ignore_for_file: non_constant_identifier_names
// Taken from https://medium.flutterdevs.com/date-and-time-picker-in-flutter-72141e7531c

import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:covid_consult/common/network_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:covid_consult/screens/sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final snackBar = SnackBar(
    content: const Text("Account has been successfully registered!"),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.pink.shade500,
  );
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  final TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  String username = "";
  String password1 = "";
  String email = "";
  String name = "";
  String dob = "";
  String gender = "";
  String phone_num = "";
  String role = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: const Color(0xFF383838),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  child: const Center(
                    child: Text(
                      "✨ Hello ✨ ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Center(
                  child: Text(
                    "Sign up to get started",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                // Username
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey.shade100),
                    cursorColor: Colors.grey.shade100,
                    decoration: InputDecoration(
                      fillColor: Colors.deepPurple.shade50,
                      hintText: "Masukkan Username",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.grey.shade300),
                      floatingLabelStyle:
                          const TextStyle(color: Color(0xFF9F7AEA)),
                      icon: const Icon(
                        Icons.person,
                        color: Color(0xFF9F7AEA),
                      ),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF9F7AEA), width: 1.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        username = value!;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),

                // Name
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey.shade100),
                    cursorColor: Colors.grey.shade100,
                    decoration: InputDecoration(
                      fillColor: Colors.deepPurple.shade50,
                      hintText: "Masukkan Nama",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      labelText: "Nama",
                      labelStyle: TextStyle(color: Colors.grey.shade300),
                      floatingLabelStyle:
                          const TextStyle(color: Color(0xFF9F7AEA)),
                      icon: const Icon(
                        Icons.person,
                        color: Color(0xFF9F7AEA),
                      ),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF9F7AEA), width: 1.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        name = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        name = value!;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama Lengkap tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),

                // Email
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey.shade100),
                    cursorColor: Colors.grey.shade100,
                    decoration: InputDecoration(
                      fillColor: Colors.deepPurple.shade50,
                      hintText: "Masukkan Email",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.grey.shade300),
                      floatingLabelStyle:
                          const TextStyle(color: Color(0xFF9F7AEA)),
                      icon: const Icon(
                        Icons.email,
                        color: Color(0xFF9F7AEA),
                      ),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF9F7AEA), width: 1.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        email = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        email = value!;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = RegExp(pattern);
                      if (value!.isEmpty) {
                        return 'Email tidak boleh kosong';
                      } else if (!regex.hasMatch(value)) {
                        return 'Enter Valid Email';
                      }
                      return null;
                    },
                  ),
                ),

                // Password
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.grey.shade100),
                    cursorColor: Colors.grey.shade100,
                    decoration: InputDecoration(
                      fillColor: Colors.deepPurple.shade50,
                      hintText: "Masukkan Password",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.grey.shade300),
                      floatingLabelStyle:
                          const TextStyle(color: Color(0xFF9F7AEA)),
                      icon: const Icon(
                        Icons.lock,
                        color: Color(0xFF9F7AEA),
                      ),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF9F7AEA), width: 1.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        password1 = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        password1 = value!;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),

                // No. HP
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.grey.shade100),
                    cursorColor: Colors.grey.shade100,
                    decoration: InputDecoration(
                      fillColor: Colors.deepPurple.shade50,
                      hintText: "Masukkan Nomor Hp",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      labelText: "Nomor Hp",
                      labelStyle: TextStyle(color: Colors.grey.shade300),
                      floatingLabelStyle:
                          const TextStyle(color: Color(0xFF9F7AEA)),
                      icon: const Icon(
                        Icons.phone_android,
                        color: Color(0xFF9F7AEA),
                      ),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF9F7AEA), width: 1.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        phone_num = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        phone_num = value!;
                      });
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      RegExp regExp = RegExp(patttern);
                      if (value!.isEmpty) {
                        return 'Please enter mobile number';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter valid mobile number';
                      }
                      return null;
                    },
                  ),
                ),

                // DoB
                InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.grey.shade100),
                        // textAlign: TextAlign.center,
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _dateController,
                        decoration: InputDecoration(
                          hintText: "Masukkan Tanggal Lahir",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          labelText: "Tanggal Lahir",
                          labelStyle: TextStyle(color: Colors.grey.shade300),
                          floatingLabelStyle:
                              const TextStyle(color: Color(0xFF9F7AEA)),
                          icon: const Icon(
                            Icons.calendar_today,
                            color: Color(0xFF9F7AEA),
                          ),
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  // color: Color(0xFF9F7AEA), width: 1.0),
                                  color: Colors.white,
                                  width: 1.0)),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (dob) {
                          if (dob ==
                              DateFormat('yyyy-MM-dd').format(DateTime.now())) {
                            return 'Please enter valid date of birth';
                          }
                          return null;
                        },
                      ),
                    )),

                // Gender
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 10.0),
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(40, 10, 0, 1),
                        child: Text(
                          'Jenis Kelamin',
                          style: TextStyle(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ))),

                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 40, 10),
                  child: Row(
                    children: [
                      Radio(
                        value: "male",
                        groupValue: gender,
                        onChanged: (String? value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      Text('Laki - laki',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey.shade300,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Radio(
                        value: "female",
                        groupValue: gender,
                        onChanged: (String? value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      Text('Perempuan',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey.shade300,
                          )),
                    ],
                  ),
                ),

                // Role
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 4.0),
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(40, 10, 0, 1),
                        child: Text(
                          'Saya adalah seorang ',
                          style: TextStyle(
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 0, 40, 10),
                  child: Row(
                    children: [
                      Radio(
                        value: "doctor",
                        groupValue: role,
                        onChanged: (String? value) {
                          setState(() {
                            role = value!;
                          });
                        },
                      ),
                      Text(
                        'Dokter',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Radio(
                        value: "patient",
                        groupValue: role,
                        onChanged: (String? value) {
                          setState(() {
                            role = value!;
                          });
                        },
                      ),
                      Text(
                        'Pasien/Pengunjung',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.825,
                    margin: EdgeInsets.fromLTRB(size.width * 0.08, 0, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFF24262A),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF9F7AEA)),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Submit to Django server and wait for response
                          final response = await request.postJson(
                              "http://127.0.0.1:8000/accounts/signupFlutter",
                              convert.jsonEncode(<String, String>{
                                'username': username,
                                'password': password1,
                                'email': email,
                                "name": name,
                                "dob": dob, //di django convert lagi ke datetime
                                "gender": gender,
                                "phone_num": phone_num,
                                "role": role,
                              }));
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInScreen()));
                          } else {
                            if (response['status'] == 'User Exists') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "Account with this username already exists."),
                              ));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text("An error occured, please try again."),
                              ));
                            }
                          }
                        }
                      },
                      child: const Text(
                        'Buat Akun',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an Account ? ",
                      style: TextStyle(color: Colors.white70),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen())),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            // fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9F7AEA),
                            height: 1.5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dob = DateFormat('yyyy-MM-dd').format(selectedDate);
        _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    } else {
      // ignore: avoid_print
      print("tanggal invalid");
    }
  }
}
