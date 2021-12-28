// ignore_for_file: non_constant_identifier_names
// Taken from https://medium.flutterdevs.com/date-and-time-picker-in-flutter-72141e7531c

import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:covid_consult/common/network_service.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:covid_consult/screens/login_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
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
          backgroundColor: Colors.purpleAccent.shade400,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Covid Consult',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                // Username
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Masukkan Username",
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.grey.shade300),
                      icon: const Icon(Icons.attach_email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      hintStyle: TextStyle(color: Colors.grey.shade300),
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
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Masukkan Nama Lengkap",
                      labelText: "Nama Lengkap",
                      labelStyle: TextStyle(color: Colors.grey.shade300),
                      icon: const Icon(Icons.attach_email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      hintStyle: TextStyle(color: Colors.grey.shade300),
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
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Masukkan Email",
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.grey.shade300),
                      icon: const Icon(Icons.attach_email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      hintStyle: TextStyle(color: Colors.grey.shade300),
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

                // No. HP
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Masukkan Nomor Ponsel",
                      labelText: "Nomor Ponsel",
                      labelStyle: TextStyle(color: Colors.grey.shade300),
                      icon: const Icon(Icons.attach_email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      hintStyle: TextStyle(color: Colors.grey.shade300),
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
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _dateController,
                        decoration: InputDecoration(
                          hintText: "Masukkan Tanggal Lahir",
                          labelText: "Tanggal Lahir",
                          labelStyle: TextStyle(color: Colors.grey.shade300),
                          icon: const Icon(Icons.attach_email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          hintStyle: TextStyle(color: Colors.grey.shade300),
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
                  child: const Text(
                    'Radio Button',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
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
                      const Text(
                        'Male',
                        style: TextStyle(fontSize: 16.0),
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
                      const Text(
                        'Female',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),

                // Role
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 10.0),
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'I\'m a',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ))),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
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
                      const Text(
                        'Doctor',
                        style: TextStyle(fontSize: 16.0),
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
                      const Text(
                        'Patient/Visitor',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),

                // Password
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10.0),
                  child: TextFormField(
                    obscureText: true,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Masukkan Password",
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.grey.shade300),
                      icon: const Icon(
                        Icons.lock_outline,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade300),
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

                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFF24262A),
                    ),
                    child: TextButton(
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
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Account has been successfully registered!"),
                            ));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
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
                            fontSize: 22,
                            color: Colors.white,
                            height: 1.5,
                            fontWeight: FontWeight.bold),
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
                      'Already have an account?',
                      style: TextStyle(
                          fontSize: 22, color: Colors.white, height: 1.5),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            height: 1.5,
                            fontWeight: FontWeight.bold),
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
