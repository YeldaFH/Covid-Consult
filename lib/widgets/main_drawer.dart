import 'package:covid_consult/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:forum/forum.dart';
import 'package:obatpedia/obatpedia.dart';
import 'package:profil/profil.dart';
import 'package:article/article.dart';
// import 'package:consultation/consultation.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, void Function() tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Mulish',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: const Color.fromRGBO(27, 27, 27, 1),
            child: const Text(
              'Covid Consult',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromRGBO(255, 255, 255, 1),)
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Home', Icons.home, () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const MyHomePage(title: 'HomePage')));
          }),          
          buildListTile('Consultation', Icons.receipt_rounded, () {
            // Navigator.push(context,MaterialPageRoute(builder: (context) => const MainConsultation(title: 'Consultation')));
          }),
          buildListTile('Forum', Icons.forum, () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => MainForum(title: 'Forum',currentCategory: 'All Category')));
          }),
          buildListTile('Obatpedia', Icons.medication, () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const MainObatpedia(title: 'Obatpedia')));
          }),
          buildListTile('Article', Icons.article, () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const MainArticle(title: 'Article')));
          }),
          buildListTile('Profile', Icons.supervised_user_circle, () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const MainProfile(title: 'Obatpedia')));
          }),
          buildListTile('Logout', Icons.login, () {
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}