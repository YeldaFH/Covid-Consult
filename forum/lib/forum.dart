// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables, prefer_const_constructors, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_is_empty, non_constant_identifier_names, unused_field, duplicate_ignore, sized_box_for_whitespace
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:forum/api/api.dart';
import 'package:covid_consult/widgets/main_drawer.dart';
import 'package:forum/screens/add_forum.dart';
import 'package:forum/screens/detail_forum.dart';
import 'package:forum/screens/detail_forum_search.dart';
import 'package:provider/provider.dart';
import 'package:covid_consult/common/network_service.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Forum';
  static const String currentCategory = 'All Category';
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
            brightness: Brightness.dark, primarySwatch: Colors.purple),
        themeMode: ThemeMode.dark,
        title: title,
        home: MainForum(title: title, currentCategory: currentCategory),
      );
}

class MainForum extends StatefulWidget {
  final String title;
  final String currentCategory;
  // ignore: use_key_in_widget_constructors
  MainForum({
    required this.title,
    required this.currentCategory,
  });

  @override
  _MainForumState createState() => _MainForumState();
}

class _MainForumState extends State<MainForum> {
  PostForum PostService = PostForum();
  final _searchBy = ['All', 'Title', 'Content', 'Author'];
  String? value;

  String get currentCategory => widget.currentCategory;
  DropdownMenuItem<String> buildMenuItem(String value) =>
      DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: const TextStyle(color: Colors.white),
        ),
      );

  var topCategoyIcons = Container(
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
        CategoryIcon(Icons.category_rounded, "All Category"),
        CategoryIcon(Icons.graphic_eq_outlined, "General Discussion"),
        CategoryIcon(Icons.verified_user_sharp, "Covid Info"),
      ],
    ),
  );

  var categoryMetric = Container(
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
        CategoryIcon(Icons.medical_services, "Drug Info"),
        CategoryIcon(Icons.supervised_user_circle_sharp, "My Discussion"),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xff131313),
        title: Text(
          widget.title,
          textScaleFactor: 1.3,
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          topCategoyIcons,
          categoryMetric,
          Container(
            child: Text(
              currentCategory,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          ),
          FutureBuilder<List>(
            future: PostService.getForumCategory(request, currentCategory),
            builder: (context, snapshot) {
              if (snapshot.data?.length == 0) {
                return const Center(
                  child: Text("0 Forum"),
                );
              }
              // print(snapshot);

              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var kategori = snapshot.data![index].kategori;
                    var category;
                    switch (kategori) {
                      case "general":
                        {
                          category = "General";
                        }
                        break;
                      case "covid":
                        {
                          category = "Covid Info";
                        }
                        break;
                      case "drug":
                        {
                          category = "Drug Info";
                        }
                        break;
                    }
                    var dataForum = snapshot.data![index];
                    var day = dataForum.dateTime.substring(8, 10);
                    var month = dataForum.dateTime.substring(5, 7);
                    var year = dataForum.dateTime.substring(0, 4);
                    var time = dataForum.dateTime.substring(11, 16);
                    var dateTime =
                        day + '-' + month + '-' + year + ' ' + time + ' WIB';
                    var temp = dataForum.isi;
                    if (dataForum.isi.length > 20) {
                      temp = dataForum.isi.substring(0, 20) + "...";
                    }
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: HexColor(dataForum.warna),
                          foregroundColor: Colors.black,
                          radius: 25,
                          child: Text(
                            dataForum.namaPenulis[0].toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(dataForum.judul + " [" + category + "]"),
                        isThreeLine: true,
                        subtitle: Text(' by ' +
                            dataForum.namaPenulis +
                            ' on ' +
                            dateTime +
                            '\n' +
                            temp),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => DetailForum(dataForum))),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("-->>${snapshot.error}<<--");
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
      floatingActionButton: BouncingWidget(
        scaleFactor: 1.5,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddForum()));
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: const BoxDecoration(
            color: Color(0xff6B46C1), // border color
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon(this.icon, this.iconText);

  final String iconText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            if (iconText == 'All Category') {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => MainForum(
                          title: 'Forum', currentCategory: 'All Category')),
                  (Route<dynamic> route) => false);
            } else if (iconText == 'General Discussion') {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => MainForum(
                          title: 'Forum',
                          currentCategory: 'General Discussion')),
                  (Route<dynamic> route) => false);
            } else if (iconText == 'Drug Info') {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => MainForum(
                          title: 'Forum', currentCategory: 'Drug Info')),
                  (Route<dynamic> route) => false);
            } else if (iconText == 'Covid Info') {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => MainForum(
                          title: 'Forum', currentCategory: 'Covid Info')),
                  (Route<dynamic> route) => false);
            } else if (iconText == 'My Discussion') {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => MainForum(
                          title: 'Forum', currentCategory: 'My Discussion')),
                  (Route<dynamic> route) => false);
            }
          },
        ),
        Text(iconText)
      ],
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

// Search Page
class _SearchPageState extends State<SearchPage> {
  List<dynamic> searchResults = [];
  bool _load = false;
  searchDjango(value) async {
    SearchService.searchForum(value).then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      print(data);
      setState(() {
        for (var value in data) {
          searchResults.add(value);
        }
      });
    });
  }

  var nameHolder = TextEditingController();
  clearTextInput() {
    nameHolder.clear();
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Widget loadingIndicator = _load
            ? AlertDialog(
                title: Text("Searching..."),
                content: Container(
                  height: 100,
                  child: Column(
                    children: const <Widget>[
                      CircularProgressIndicator(),
                      Text("Please wait...")
                    ],
                  ),
                ),
              )
            : Container();
        return Align(
          child: loadingIndicator,
          alignment: FractionalOffset.center,
        );
      },
    );
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _load = false;
      });
      Navigator.pop(context); //pop dialog
    });
  }

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 500);
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            controller: nameHolder,
            onChanged: (value) {
              debouncer.run(() {
                setState(() {
                  searchResults = [];
                  _load = true;
                  _onLoading();
                  searchDjango(value);
                });
              });
            },
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: clearTextInput,
                ),
                hintText: 'Search...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none),
          ),
        ),
      )),
      body: searchResults.isEmpty
          ? const Center(
              child: Text(
                'No Result',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView(
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildResultCard(searchResults[index]);
                  },
                ),
              ],
            ),
    );
  }

  Widget buildResultCard(searchResult) {
    if (searchResult['isi'].length > 20) {
      searchResult['isi'] = searchResult['isi'].substring(0, 20) + "...";
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: HexColor(searchResult['warna']),
                foregroundColor: Colors.black,
                radius: 25,
                child: Text(
                  searchResult['namaPenulis'][0].toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(searchResult['judul'] +
                  " [" +
                  searchResult['kategori'] +
                  "]"),
              isThreeLine: true,
              subtitle: Text(' by ' +
                  searchResult['namaPenulis'] +
                  ' on ' +
                  searchResult['DateTime'].substring(0, 10) +
                  ' ' +
                  searchResult['DateTime'].substring(11, 16) +
                  ' WIB\n' +
                  searchResult['isi']),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailForumSearch(searchResult))),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ],
      ),
    );
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

class Debouncer {
  int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
