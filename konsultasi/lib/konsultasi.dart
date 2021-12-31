import 'package:covid_consult/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  );
}