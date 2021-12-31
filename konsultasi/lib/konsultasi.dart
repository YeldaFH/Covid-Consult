import 'package:covid_consult/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konsultasi/models/model.dart';
import 'package:konsultasi/screens/consultation_patient.dart';
import 'package:konsultasi/screens/consultation_form.dart';
import 'package:covid_consult/widgets/main_drawer.dart';
import 'package:konsultasi/api/api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const title = 'Consultation';
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: ThemeData(
        brightness: Brightness.dark, primarySwatch: Colors.purple),
    themeMode: ThemeMode.dark,
    title: title,
    home: const ConsultationPatient(title: title),
  );
}

class MainConsultation extends StatefulWidget {
  final String title;

  const MainConsultation({
    required this.title
  });

  @override
  _MainConsultationState createState() => _MainConsultationState();
}

class _MainConsultationState extends State<MainConsultation> {
  GetProfile profile = GetProfile();
  GetConsultationPatient consultationPatient = GetConsultationPatient();

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
              child: Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    FutureBuilder(
                      future: GetConsultationPatient().getConsultationPatient(),
                      // future: Future.wait([GetConsultationPatient().getConsultationPatient(),
                      // GetProfile().getProfile()]),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text("-->>${snapshot.error}<<--");
                        }
                        else if (snapshot.hasData) {
                          List<Consultation>? consultation = snapshot.data as List<Consultation>;
                          return Row(
                              children: [
                                for (var data in consultation)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  textDirection: TextDirection.rtl,
                                  children: <Widget>[
                                    Text(
                                      data.startKonsultasi + " - " + data.endKonsultasi,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      data.namaDokter,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                    )
                                  ]
                                )
                            ]);
                        }
                        return CircularProgressIndicator();
                      }
                    )
                  ]
                )
              )
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
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            )
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
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            )
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
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            )
          ),
          Container(
            child: Text(
              "Jumat",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
          ),
          Container(
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              )
          ),
        ],
      ),
    );
  }
}