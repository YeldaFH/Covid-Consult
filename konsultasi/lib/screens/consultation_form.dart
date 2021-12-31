// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unnecessary_this, no_logic_in_create_state, unnecessary_brace_in_string_interps, avoid_unnecessary_containers
import 'package:konsultasi/konsultasi.dart';
import 'package:flutter/material.dart';
import 'package:covid_consult/widgets/main_drawer.dart';
import 'package:covid_consult/common/network_service.dart';
import 'package:konsultasi/models/model.dart';
import 'package:provider/provider.dart';
import 'package:konsultasi/api/api.dart';
import 'dart:convert' as convert;

class ConsultationForm extends StatefulWidget {
  final String title;

  const ConsultationForm({
    required this.title
  });

  @override
  Add_Consultation createState() => Add_Consultation();
}

// ignore: camel_case_types
class Add_Consultation extends State<ConsultationForm> {
  final _formKey = GlobalKey<FormState>();
  String namaDokter = "";
  String namaPasien = "";
  String waktuKonsultasi = "";
  String nomorHandphone = "";
  String hariKonsultasi = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xff131313),
        title: Text(
          widget.title,
          textScaleFactor: 1.3,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(padding: EdgeInsets.all(16), children: [
          Container(
            child: Text(
              'Add New Consultation',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text(
              'Nama Dokter',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
          ),
          Container(
            // child: FutureBuilder<List<Profile>>(
            //   future: GetProfile().getProfile(),
            //   builder: (context, snapshot) {
            //     return DropdownButton<String>(
            //       value: 'Nama Dokter',
            //       icon: const Icon(Icons.arrow_downward),
            //       elevation: 16,
            //       underline: Container(
            //         height: 2,
            //         color: Colors.deepPurpleAccent,
            //       ),
            //       onChanged: (String? value) {
            //         setState(() {
            //           namaDokter = value!;
            //         });
            //       },
            //       items: snapshot.data!.map<DropdownMenuItem<String>>((d) =>
            //         DropdownMenuItem<String>(
            //           child: Text(d.name),
            //           value: d.name,
            //         )
            //       ).toList()
            //     );
            //   }
            // ),
          ),
          Container(
            child: Text(
              'Nama Pasien',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
          ),
          Container(
              child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Nama Pasien'),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
              setState(() {
                namaPasien = value!;
              });
            },
            onChanged: (String? value) {
              setState(() {
                namaPasien = value!;
              });
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Nama Pasien Tidak Boleh Kosong';
              }
              return null;
            },
          )),
          Container(
            child: Text(
              'Waktu Konsultasi',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
          ),
          Container(
              child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Waktu Konsultasi'),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
              setState(() {
                waktuKonsultasi = value!;
              });
            },
            onChanged: (String? value) {
              setState(() {
                waktuKonsultasi = value!;
              });
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Waktu Konsultasi Tidak Boleh Kosong';
              }
              return null;
            },
          )),
          Container(
            child: Text(
              'Nomor Handphone',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
          ),
          Container(
              child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Nomor Handphone'),
            onSaved: (String? value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
              setState(() {
                nomorHandphone = value!;
              });
            },
            onChanged: (String? value) {
              setState(() {
                nomorHandphone = value!;
              });
            },
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Nomor Handphone Tidak Boleh Kosong';
              }
              return null;
            },
          )),
          Container(
            child: Text(
              'Hari Konsultasi',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
          ),
          Container(
            child: DropdownButton<String> (
              value: "Senin",
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  hariKonsultasi = value!;
                });
              },
              items: <String>['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat']
                  .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
              }).toList(),
            )
          ),
          Container(
            child: Text(
              'Email',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
          ),
          Container(
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Email'),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                  setState(() {
                    email = value!;
                  });
                },
                onChanged: (String? value) {
                  setState(() {
                    email = value!;
                  });
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Email Tidak Boleh Kosong';
                  }
                  return null;
                },
              )
          ),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
              ),
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? true) {
                  final response = await request.postJson(
                    'https://covid-consult-herokuapp.com/consultation/flutter-consultation-form',
                    convert.jsonEncode(<String, String>{
                      'nama_dokter': namaDokter,
                      'nama_pasien': namaPasien,
                      'waktu_konsultasi': waktuKonsultasi,
                      'nomor_handphone': nomorHandphone,
                      'hari_konsultasi': hariKonsultasi,
                      'email': email
                    })
                  );
                  if (response['status'] == 'success') {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text("Successfully created forum!"),
                    ));
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => MainConsultation(
                            title: 'Consultation')
                        )
                    );
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content:
                      Text("An error occured, please try again."),
                    ));
                  }
                }
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const MainConsultation(title: 'Consultation Form')));
              },
              child: Text(
                'Submit',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),

        ]),
      ),
    );
  }
}
