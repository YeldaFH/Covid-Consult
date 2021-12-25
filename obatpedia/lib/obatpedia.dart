import 'package:covid_consult/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'HomePage';
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
            brightness: Brightness.dark, primarySwatch: Colors.purple),
        themeMode: ThemeMode.dark,
        title: title,
        home: const MainObatpedia(title: title),
      );
}

class MainObatpedia extends StatefulWidget {
  final String title;

  // ignore: use_key_in_widget_constructors
  const MainObatpedia({
    required this.title,
  });

  @override
  _MainObatpediaState createState() => _MainObatpediaState();
}

class _MainObatpediaState extends State<MainObatpedia> {



  @override
  Widget build(BuildContext context) => Scaffold(
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
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: const Color(0xff6B46C1),
                  borderRadius: BorderRadius.circular(20)),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Ini Obatpedia',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            ),
          ],
        ),
      );
}

