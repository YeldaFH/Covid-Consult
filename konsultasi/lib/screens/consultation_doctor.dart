import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_consult/widgets/main_drawer.dart';
import 'package:konsultasi/screens/consultation_form.dart';

class ConsultationDoctor extends StatefulWidget {
  final String title;

  const ConsultationDoctor({
    required this.title
  });

  @override
  _ConsultationDoctorState createState() => _ConsultationDoctorState();
}

class _ConsultationDoctorState extends State<ConsultationDoctor> {
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
          Container(
            child: Text(
              "Senin",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
          ),
          Container(

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