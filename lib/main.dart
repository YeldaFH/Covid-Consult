// import 'package:forum/api/api.dart';
// import 'package:flutter/material.dart';
 import 'package:article/article.dart';
import 'package:provider/provider.dart';
// import './screens/addTodo.dart';
import 'package:covid_consult/cookie/CookieRequest.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'HomePage';
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();

          return request;
        },child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
            brightness: Brightness.dark, primarySwatch: Colors.purple),
        themeMode: ThemeMode.dark,
        title: title,
        home: const MainPage(title: title),
    ));
  }
}

class MainPage extends StatefulWidget {
  final String title;

  // ignore: use_key_in_widget_constructors
  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<Color> colors = [
    Colors.black,
    Colors.black45,
    
  ];
  final List<String> letters = [
    "Covid Consult\n\n ''Let's make the world a better place''",
    "Latar Belakang\n\n Pandemi Covid-19 telah membawa banyak perubahan dalam kehidupan manusia. Hampir seluruh kegiatan yang awalnya dilakukan secara offline sekarang dilakukan secara online. Beberapa di antaranya adalah kegiatan belajar mengajar, transaksi jual beli, dan konsultasi kesehatan. Untuk itu, CovidConsult hadir sebagai salah satu jalan untuk memungkinkan terjadinya konsultasi kesehatan secara online. CovidConsult memungkinkan setiap orang mendapatkan konsultasi kesehatan dimanapun dan kapanpun bersama tenaga kesehatan yang dapat dipilih sendiri. CovidConsult juga akan menyediakan data terkait pandemi Covid-19. Dilengkapi dengan forum diskusi yang dapat digunakan pengguna untuk bertanya dan bertukar informasi mengenai berbagai yang berkaitan dengan kesehatan. Untuk memastikan forum ini berjalan sesuai dengan tujuan awalnya akan ada moderator yang mengawasi forum yang telah dibuat. Selain itu, terdapat halaman informasi obat yang memungkinkan pengguna mencari tahu informasi mengenai obat yang sedang dikonsumsi ataupun yang akan dibeli.",
  ];

  bool _isPlaying = false;

  CarouselSliderController _sliderController = CarouselSliderController();

  
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
        body:  ListView(
        children: <Widget>[
          Container(
            height: 400,
            child: CarouselSlider.builder(
              unlimitedMode: true,
              controller: _sliderController,
              slideBuilder: (index) {
                return Container(
                  
                  alignment: Alignment.center,
                  color: colors[index],
                  child: Text(
                    letters[index],
                    style: TextStyle(fontSize: 14, color: Colors.white),textAlign: TextAlign.center,
                    
                  ),
                );
              },
              slideTransform: CubeTransform(),
              slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.only(bottom: 32),
                indicatorBorderColor: Colors.purple,
              ),
              itemCount: colors.length,
              initialPage: 0,
  
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 21),
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
              child: 
              Text('Our Service',textAlign: TextAlign.center,
              style: 
              TextStyle(fontSize: 32,
              fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            ),
          Container(
          margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 30),
          height: 150.0,
          
          child: 
          ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                width: 150.0,
                
                child: ListView(
                  children:[
                  Text("Article",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                  IconButton(
                    icon: const Icon(Icons.article),
                    iconSize: 80,
                    tooltip: 'Article',
                    onPressed:() {
                    Navigator.push(context,MaterialPageRoute(builder: (_) => MainArticle(title: 'Article',)));  
                    },  
                  ),
                  ]
                )
                
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                width: 150.0,
                
                child: ListView(
                  children:[
                  Text("Forum",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                  IconButton(
                    icon: const Icon(Icons.forum),
                    iconSize: 80,
                    tooltip: 'Forum',
                    onPressed:() {
                    // Navigator.push(context,MaterialPageRoute(builder: (_) => MainArticle(title: 'Article',)));  
                    },  
                  ),
                  ]
                )
                
              ),
              
              
            ],
          ),
        ),
        
         Container(
          margin: const EdgeInsets.symmetric(vertical: 0,horizontal: 30),
          height: 150.0,
          
          child: 
          ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                width: 150.0,
                
                child: ListView(
                  children:[
                  Text("Konsultasi",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                  IconButton(
                    icon: const Icon(Icons.health_and_safety),
                    iconSize: 80,
                    tooltip: 'Konsultasi',
                    onPressed:() {
                    // Navigator.push(context,MaterialPageRoute(builder: (_) => MainArticle(title: 'Article',)));  
                    },  
                  ),
                  ]
                )
                
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                width: 150.0,
                
                child: ListView(
                  children:[
                  Text("ObatPedia",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                  IconButton(
                    icon: const Icon(Icons.medical_services),
                    iconSize: 80,
                    tooltip: 'ObatPedia',
                    onPressed:() {
                    // Navigator.push(context,MaterialPageRoute(builder: (_) => MainArticle(title: 'Article',)));  
                    },  
                  ),
                  ]
                )
                
              ),
              
              
            ],
          ),
        ),
        ],
      ),
      
      );
}

