import 'package:covid_consult/common/network_service.dart';
import 'package:covid_consult/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:profil/models/model.dart';
import 'package:profil/screens/profile_edit.dart';
import 'package:provider/provider.dart';
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
        home: const MainProfile(title: title),
      );
}

class MainProfile extends StatefulWidget {
  final String title;

  // ignore: use_key_in_widget_constructors
  const MainProfile({
    required this.title,
  });

  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {

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
      children: [ 
        Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: const Text(
              "Profile",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            )
          ),
          FutureBuilder<List>(
            future: fetchProfile(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final request = context.watch<NetworkService>();
                
                var user = request.username;
                var data = snapshot.data![0];
                var name = data.name;
                var dob = data.dob;
                var email = data.email;
                var gender = data.gender;
                var phoneNum = data.phoneNum;
                var role = data.role;
                var profilColor = data.profilColor; 

                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor(profilColor),
                        foregroundColor: Colors.black,
                        radius: 35,
                        child: Text(
                          user[0].toUpperCase(),
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(top: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                          child: Column(children: [
                          const Text(
                            "User Data",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Mulish',
                              color: Colors.white
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(children: [
                            Text("Name" , style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                            SizedBox(width: 91,),
                            Text(name, style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                          ],),
                          SizedBox(height: 10),
                          Row(children: [
                            Text("Gender" , style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                            SizedBox(width: 84,),
                            Text(gender, style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                          ],),
                          SizedBox(height: 10),
                          Row(children: [
                            Text("Birth Date" , style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                            SizedBox(width: 65,),
                            Text(dob, style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                          ],),
                          SizedBox(height: 10),
                          Row(children: [
                            Text("E-Mail" , style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                            SizedBox(width: 92,),
                            Text(email , style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                          ],),
                          SizedBox(height: 10),
                          Row(children: [
                            Text("Phone Number" , style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                            SizedBox(width: 29,),
                            Text(phoneNum, style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                          ],),
                          SizedBox(height: 10),
                          Row(children: [
                            Text("User Type" , style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                            SizedBox(width: 66,),
                            Text(role, style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                          ],),
                          SizedBox(height: 10),
                          Row(children: [
                            Text("Username" , style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                            SizedBox(width: 64,),
                            Text(user, style: TextStyle(fontFamily: 'Mulish', fontSize: 16, color: Colors.white),),
                          ],),
                          SizedBox(height: 10),
                          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            TextButton(
                              child: const Text("EDIT", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>
                                      EditProfile()));
                              },
                            )
                          ],),
                        ],),
                        )
                      )
                    ],
                  )
                );
              }
              return Text("${snapshot.error}");
            },
          )
        ],),
      ],
    ),
  );}

  Future<List<Fields>> fetchProfile() async {
    final request = context.watch<NetworkService>();
    String url = 'https://covid-consult.herokuapp.com/profile/getflutter/';

    final response = await request.get(url);

    List<Fields> result = [];
    for (var item in response) {
      if (item != null) {
        result.add(Fields.fromJson(item));
      }
    }

    return result;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

