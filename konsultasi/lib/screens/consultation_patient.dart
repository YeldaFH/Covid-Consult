// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unnecessary_this, no_logic_in_create_state, unnecessary_brace_in_string_interps, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:covid_consult/widgets/main_drawer.dart';
import 'package:konsultasi/screens/consultation_form.dart';

class ConsultationPatient extends StatefulWidget {
  final String title;

  const ConsultationPatient({
    required this.title
  });

  @override
  _ConsultationPatientState createState() => _ConsultationPatientState();
}

class _ConsultationPatientState extends State<ConsultationPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xff131313),
        title: Text(
          widget.title,
          textScaleFactor: 1.3,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Container(
            child: Text(
              'Jadwal Konsultasi',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConsultationForm(title: 'Consultation Form')));
              },
              child: Text(
                'Booking Konsultasi',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              "Senin",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
          ),
          Container(
            child: Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(
                  "Waktu",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Dokter",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            child: Text(
              "Selasa",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
          ),
          Container(

          ),
          Container(
            child: Text(
              "Rabu",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
          ),
          Container(

          ),
          Container(
            child: Text(
              "Kamis",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
          ),
          Container(

          ),
          Container(
            child: Text(
              "Jumat",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
          ),
        ],
      ),
    );
  }
}