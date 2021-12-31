import 'package:flutter/material.dart';
import 'package:covid_consult/screens/sign_in.dart';
// import 'package:forum/forum.dart';
// import 'package:article/article.dart';
import 'package:covid_consult/common/network_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'HomePage';
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          NetworkService request = NetworkService();

          return request;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
              brightness: Brightness.dark, primarySwatch: Colors.deepPurple),
          themeMode: ThemeMode.dark,
          title: title,
          home: const SignInScreen(),
        ));
  }
}
