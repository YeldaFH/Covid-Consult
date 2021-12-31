// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unnecessary_this, no_logic_in_create_state, avoid_print, avoid_types_as_parameter_names, non_constant_identifier_names
import 'package:covid_consult/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:obatpedia/models/model.dart';
import 'package:provider/provider.dart';
import 'package:covid_consult/common/network_service.dart';
import 'package:search_page/search_page.dart';
import 'package:obatpedia/screens/medicine_details.dart';
import 'package:obatpedia/screens/add_medicine.dart';

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

  const MainObatpedia({
    required this.title,
  });

  @override
  _MainObatpediaState createState() => _MainObatpediaState();
}

class _MainObatpediaState extends State<MainObatpedia> {

  static List<MedicineModel> medicines = [];

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
            onPressed: () => showSearch(
                context: context,
                delegate: SearchPage<MedicineModel>(
                    onQueryUpdate: (s) => print(s),
                    items: medicines,
                    searchLabel: 'Search Medicine',
                    suggestion: const Center(
                      child: Text("Search medicines by name"),
                    ),
                    failure: const Center(
                        child: Text("No medicine found.")
                    ),
                    filter: (MedicineModel) => [
                      MedicineModel.name,
                    ],
                    builder: (MedicineModel) => GestureDetector(
                      child: Card(
                        child: Column(
                            children: <Widget>[
                              Image(
                                image: NetworkImage('https://covid-consult.herokuapp.com/media/' + MedicineModel.image,
                                ),
                                height: 200,
                              ),
                              ListTile(
                                title: Text(MedicineModel.name),
                                subtitle: Text(MedicineModel.description),
                              )
                            ]
                        ),
                      ),
                      onTap:() => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => medicineDetails(MedicineModel))
                      ),
                    )
                )
            ),
            child: const Text(
              'Search Medicine',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        ),

        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color(0xff6B46C1),
              borderRadius: BorderRadius.circular(20)),
          // ignore: deprecated_member_use
          child: FlatButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (_) => MedicineForm()));
            },
            child: const Text(
              'Add Medicine',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        ),
        Column(
            children: [
              FutureBuilder<List>(
                future: getMedicine(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<MedicineModel>? kutipObat = snapshot.data as List<MedicineModel>;
                    medicines = kutipObat;
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          var dataMedicine = snapshot.data![index];
                          return GestureDetector(
                            child: Card(
                              child: Column(
                                  children: <Widget>[
                                    Image(
                                      image: NetworkImage('https://covid-consult.herokuapp.com/media/' + dataMedicine.image,
                                      ),
                                      height: 200,
                                    ),
                                    ListTile(
                                      title: Text(dataMedicine.name),
                                      subtitle: Text(dataMedicine.description),
                                    )
                                  ]
                              ),
                            ),
                            onTap:() => Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => medicineDetails(dataMedicine))
                            ),
                          );
                        });
                  }
                  return CircularProgressIndicator();
                },
              )
            ]
        )
      ],
    ),
  );

  Future<List<MedicineModel>> getMedicine() async {
    final request = context.watch<NetworkService>();
    String url = 'https://covid-consult.herokuapp.com/obatpedia/http_response';

    final response = await request.get(url);

    List<MedicineModel> result = [];
    for (var d in response) {
      if (d != null) {
        result.add(MedicineModel.fromJson(d));
      }
    }
    return result;
  }
}