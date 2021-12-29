
import 'package:covid_consult/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:article/models/model.dart';
import 'package:article/widget/card.dart';
import 'add_article.dart';
import 'package:covid_consult/common/network_service.dart';
import 'package:search_page/search_page.dart';

import 'detailArticle.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Home Article';
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
            brightness: Brightness.dark, primarySwatch: Colors.purple),
        themeMode: ThemeMode.dark,
        title: title,
        home: const MainArticle(title: title),
      );
}

class MainArticle extends StatefulWidget {
  final String title;

  // ignore: use_key_in_widget_constructors
  const MainArticle({
    required this.title,
  });

  @override
  _MainArticleState createState() => _MainArticleState();
}

class _MainArticleState extends State<MainArticle> {
  
  static List<Model> people = [];
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
              child: 
              Text('Article',textAlign: TextAlign.center,
              style: 
              TextStyle(fontSize: 40,
              fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
            Column(
            children: <Widget>[
            SizedBox(height:20.0),
            ExpansionTile(
              title: Text(
                "What is an article",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'Article Function',
                    style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(' An article is an essay that contains facts, opinions, or ideas that are made to be published in online media and conventional media. Articles must be written in a structured and systematic manner so that they are easy to read and understand.'),
                    )
                  ],
                ),
                ListTile(
                  title: Text(
                    'As a means to convey the authors ideas, Train to think systematically, Understand the purpose of writing, and As a means of publishing the results of scientific thoughts.'
                  ),
                )
              ],
            ),
          ],
        ),
            // Container(
            //   child: 
            //   Text('Search Article',textAlign: TextAlign.center,
            //   style: 
            //     TextStyle(fontSize: 30,
            //     ),
            //   ),
            //   margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
            // ),
            Container(
              child: 
              Text('Gain more insights, tips about well-being,increase your idea and write yours.',textAlign: TextAlign.center,
              style: 
                TextStyle(fontSize: 20,
                ),
              ),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(color: Color(0xff6B46C1),
              borderRadius: BorderRadius.circular(20)),  
              child: FlatButton( 
                onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (_) =>BelajarForm()));  
                },
                child: 
                Text( 'Add New Article',style: TextStyle(color: Colors.white, 
                fontSize: 25),
                ), 
                ),    
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
            ),
            
            Container(
              child: FutureBuilder(
                future: fetchKutipan(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Model>? kutipArtikel = snapshot.data as List<Model>;
                    people = kutipArtikel;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: kutipArtikel.length, 
                      itemBuilder: (context, index) {  
                        return ArtikelCard(kutipArtikel[index]);
                      },                                      
                    );
                  } else if (snapshot.hasError) {
                    return Text("-->>${snapshot.error}<<--");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
        tooltip: 'Search people',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Model>(
            onQueryUpdate: (s) => print(s),
            items: people,
            searchLabel: 'Search Article',
            suggestion: Center(
              child: Text('Filter article by author name or title'),
            ),
            failure: Center(
              child: Text('No Article found'),
            ),
            filter: (model) => [
              model.penulis,
              model.judul,
              
            ],
            builder: (model) =>  Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(
                model.judul,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
          subtitle: Text(
                'Create by ' + model.penulis + ' on '+ model.datetime.substring(8,10)+'-'+model.datetime.substring(5,7)+'-'+model.datetime.substring(0,4)
              ),
          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Details(model))),
                          trailing: const Icon(Icons.read_more),
                        ),
          
    )
    ),
          ),
        ),
        child: Icon(Icons.search),
      ),
      );

   Future<List<Model>> fetchKutipan() async {
    final request = context.watch<NetworkService>();
    String url = 'https://covid-consult.herokuapp.com/article/getArtikelFlutter';

    final response = await request.get(url);

    List<Model> result = [];
    for (var d in response) {
      if (d != null) {
        result.add(Model.fromJson(d));
      }
    }
    return result;
  }

}

