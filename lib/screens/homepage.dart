// ignore_for_file: prefer_const_constructors

import 'package:article/article.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
// import 'package:covid_consult/common/network_service.dart';
// import 'package:article/article.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter/material.dart';
import 'package:covid_consult/widgets/main_drawer.dart';
import 'package:forum/forum.dart';
import 'package:konsultasi/konsultasi.dart';
import 'package:obatpedia/obatpedia.dart';

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
        home: const MyHomePage(title: title),
      );
}

class MyHomePage extends StatefulWidget {
  final String title;

  // ignore: use_key_in_widget_constructors
  const MyHomePage({
    required this.title,
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> colors = [
    Colors.black,
    Colors.black45,
  ];
  final List<String> letters = [
    "Covid Consult\n\n ''Let's make the world a better place''",
    "Latar Belakang\n\n Pandemi Covid-19 telah membawa banyak perubahan dalam kehidupan manusia. Hampir seluruh kegiatan yang awalnya dilakukan secara offline sekarang dilakukan secara online. Beberapa di antaranya adalah kegiatan belajar mengajar, transaksi jual beli, dan konsultasi kesehatan. Untuk itu, CovidConsult hadir sebagai salah satu jalan untuk memungkinkan terjadinya konsultasi kesehatan secara online. CovidConsult memungkinkan setiap orang mendapatkan konsultasi kesehatan dimanapun dan kapanpun bersama tenaga kesehatan yang dapat dipilih sendiri. CovidConsult juga akan menyediakan data terkait pandemi Covid-19. Dilengkapi dengan forum diskusi yang dapat digunakan pengguna untuk bertanya dan bertukar informasi mengenai berbagai yang berkaitan dengan kesehatan. Untuk memastikan forum ini berjalan sesuai dengan tujuan awalnya akan ada moderator yang mengawasi forum yang telah dibuat. Selain itu, terdapat halaman informasi obat yang memungkinkan pengguna mencari tahu informasi mengenai obat yang sedang dikonsumsi ataupun yang akan dibeli.",
  ];

  var modulAtas = Container(
    padding: const EdgeInsets.all(5.0),
    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        ModulIcon(Icons.article, "Article"),
        ModulIcon(Icons.forum, "Forum"),
      ],
    ),
  );
  var modulBawah = Container(
    padding: const EdgeInsets.all(5.0),
    margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        ModulIcon(Icons.health_and_safety, "Consultation"),
        ModulIcon(Icons.medical_services, "ObatPedia"),
      ],
    ),
  );

  final CarouselSliderController _sliderController = CarouselSliderController();

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
          children: <Widget>[
            // ignore: sized_box_for_whitespace
            Container(
              height: 300,
              child: CarouselSlider.builder(
                unlimitedMode: true,
                controller: _sliderController,
                slideBuilder: (index) {
                  return Container(
                    alignment: Alignment.center,
                    color: colors[index],
                    child: Text(
                      letters[index],
                      style: const TextStyle(fontSize: 13, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                slideTransform: CubeTransform(),
                slideIndicator: CircularSlideIndicator(
                  padding: EdgeInsets.only(bottom: 15),
                  indicatorBorderColor: Colors.purple,
                ),
                itemCount: colors.length,
                initialPage: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 240, maxWidth: 600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                ),
              ),
            ),
            Container(
              child: const Text(
                'Our Service',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            ),
            modulAtas,
            modulBawah,
            Container(
              child: const Text(
                'Our Team',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BouncingWidget(
                    scaleFactor: 1.5,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildAboutDialog(context),
                      );
                      // Perform some action
                    },
                    child: Container(
                      height: 35,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45.0),
                        color: const Color(0xff6B46C1),
                      ),
                      child: const Center(
                        child: Text(
                          'Meet Our Team',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(
              height: 30,
            
            ),
          ],
        ),
      );
  Widget _buildAboutDialog(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
            child: Column(
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      "Our Team",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      height: 10,
                      thickness: 5,
                      indent: 230,
                      endIndent: 230,
                      color: Color.fromRGBO(11, 53, 168, 1),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://csui2020.github.io/static/img/buku_angkatan/ZN54.jpg'),
                          radius: 30,
                        ),
                        Text(
                          "Tara",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Backend",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://csui2020.github.io/static/img/buku_angkatan/ZN45.jpg'),
                          radius: 30,
                        ),
                        Text(
                          "Valen",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Backend",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://media.discordapp.net/attachments/816138078518509590/906165040565071912/asyraf.jpg?width=685&height=675'),
                          radius: 30,
                        ),
                        Text(
                          "Asyraf",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Backend",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://csui2020.github.io/static/img/buku_angkatan/ZN55.jpg'),
                          radius: 30,
                        ),
                        Text(
                          "Yelda",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Backend",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://csui2020.github.io/static/img/buku_angkatan/ZN37.jpg"),
                          radius: 30,
                        ),
                        Text(
                          "Iqbal",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Backend",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://csui2020.github.io/static/img/buku_angkatan/MT37.jpg'),
                          radius: 30,
                        ),
                        Text(
                          "Pram",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Backend",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Colors.white,
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class ModulIcon extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ModulIcon(this.icon, this.iconText);

  final String iconText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(
            icon,
            size: 40,
          ),
          onPressed: () {
            if (iconText == 'Article') {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => MainArticle(title: 'Article',)));
            } else if (iconText == 'Forum') {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => MainForum(title: 'Forum',currentCategory: 'General Discussion')));
            } else if (iconText == 'Consultation') {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => MainConsultation(title: 'Consultation')));
            } else if (iconText == 'ObatPedia') {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => MainObatpedia(title: 'ObatPedia')));
            }
          },
        ),
        Text(iconText, style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
      ],
    );
  }
}
