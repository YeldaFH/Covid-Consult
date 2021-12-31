import 'package:covid_consult/common/network_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ConsultationForm extends StatefulWidget {
  @override
  Add_Consultation createState() => Add_Consultation();
}

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
      backgroundColor: Color(0xff131313),
      appBar: AppBar(
        title: Text('Consultation'),
        backgroundColor: Color(0xff131313),
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
            )
          ),
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
              )
          ),
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
              )
          ),
          Container(
            child: Text(
              'Hari Konsultasi',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
          ),
          Container(
            child: DropdownButton<String> (
              value: hariKonsultasi,
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
                  .map<DropdownMenuItem<String>>((String value) {
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
          )
        ]),
      ),
    );
  }
}