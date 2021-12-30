import 'package:flutter/material.dart';
import 'package:covid_consult/screens/sign_in.dart';
import 'package:covid_consult/common/network_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              unselectedWidgetColor: Colors.deepPurple.shade200),
          home: const SignInScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
