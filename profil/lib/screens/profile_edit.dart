import 'package:covid_consult/common/network_service.dart';
import 'package:flutter/material.dart';
import 'package:profil/profil.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:convert' as convert;


// ignore: camel_case_types
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfile createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  // Saved variables to be submitted

  DateTime selectedDate = DateTime.now();
  final TextEditingController _dateController = TextEditingController();
  
  String _name = "";
  String _dob = "";
  String _email = "";
  String _phoneNum = "";

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
        _dob = DateFormat('yyyy-MM-dd').format(selectedDate);
        _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    } else {
      // ignore: avoid_print
      print("tanggal invalid");
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      appBar: AppBar(
        title: const Text("Update Profile"),
        backgroundColor: const Color.fromRGBO(27, 27, 27, 1),
      ),
      // drawer: const MainDrawer(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const SizedBox(height: 50),

            // Name
            TextFormField(
              decoration: InputDecoration(
              icon: const Icon(Icons.person),
              fillColor: Colors.deepPurple.shade50,
              labelStyle: TextStyle(color: Colors.grey.shade300),
              hintText: "Insert full name here ...",
              labelText: "Name",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
              ),
              onChanged: (String? value) {
                setState(() {
                  if (value != null || value!.isNotEmpty) {
                      _name = value;
                  } else {_name = '';}
                });
              },
              onSaved: (String? value) {
                setState(() {
                  if (value != null || value!.isNotEmpty) {
                      _name = value;
                  } else {_name = '';}
                });
              },
            ), 
            const SizedBox(height: 20),

            // Date of Birth
            InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: TextFormField(
                  textAlign: TextAlign.center,
                  enabled: false,
                  keyboardType: TextInputType.text,
                  controller: _dateController,
                  decoration: InputDecoration(
                    fillColor: Colors.deepPurple.shade50,
                    hintText: "Insert birth date here ...",
                    labelText: "Birth Date",
                    icon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                    labelStyle: TextStyle(color: Colors.grey.shade300),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (dob) {
                    if (dob ==
                        DateFormat('yyyy-MM-dd').format(DateTime.now())) {
                      return 'Please enter valid date of birth';
                    }
                    return null;
                  },
                )),
            const SizedBox(height: 20),

            //E-mail
            TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.deepPurple.shade50,
                  hintText: "Insert email here ...",
                  labelText: "E-Mail",
                  labelStyle: TextStyle(color: Colors.grey.shade300),
                  icon: const Icon(Icons.mail),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                ),
                onChanged: (String? value) {
                  setState(() {
                    if (value != null || value!.isNotEmpty) {
                      _email = value;
                    } else {_email = '';}
        
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    if (value != null || value!.isNotEmpty) {
                      _email = value;
                    } else {_email = '';}
                  });
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value!)) {
                    return 'Enter Valid Email';
                  }
                  return null;
                },
              ),
            const SizedBox(height: 20),

            // Phone Number
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.deepPurple.shade50,
                hintText: "Masukkan Nomor Ponsel",
                labelText: "Nomor Ponsel",
                labelStyle: TextStyle(color: Colors.grey.shade300),
                icon: const Icon(Icons.phone),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0)),
                hintStyle: TextStyle(color: Colors.grey.shade300),
              ),
              onChanged: (String? value) {
                setState(() {
                  if (value != null || value!.isNotEmpty) {
                      _phoneNum = value;
                    } else {_phoneNum = '';}
                });
              },
              onSaved: (String? value) {
                setState(() {
                  if (value != null || value!.isNotEmpty) {
                      _phoneNum = value;
                    } else {_phoneNum = '';}
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                RegExp regExp = RegExp(patttern);
                if (!regExp.hasMatch(value!)) {
                  return 'Please enter valid mobile number';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            
            // Button
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child: 
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      // side: const BorderSide(color: Color.fromRGBO(233, 216, 253, 1), width: 2.5)
                    ),
                  child: const Text("Submit", style: TextStyle(fontSize: 20, fontFamily: 'Mulish', fontWeight: FontWeight.w500),),
                  onPressed: () async{
                    if (_formKey.currentState?.validate() ?? true) {
                      final response = await request.postJson(
                        'https://covid-consult.herokuapp.com/profile/editflutter/',
                        convert.jsonEncode(<String, String> {
                          'name' : _name,
                          'dob' : _dob,
                          'email' : _email,
                          'number' : _phoneNum
                        })
                      );
                      if (response['status']  == 'success') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Edit Successful!")));
                      }
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MainProfile(title: 'Profil',)));
                    }
                  },
                  )
                )
              ],
            )
            ],
          ),
        ),
      )
    );
  }
}