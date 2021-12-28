import 'package:flutter/material.dart';
import 'package:article/models/model.dart';

class Details extends StatelessWidget {
   Model model;
   Details(this.model);
   Widget build(BuildContext context){
     return Scaffold(
       backgroundColor: Color(0xff131313),
       appBar: AppBar(
          title: Text('Article'),
          backgroundColor: Color(0xff131313),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Container(
              child: 
              Text(model.judul,textAlign: TextAlign.center,
              style: 
              TextStyle(fontSize: 35,
              fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.fromLTRB(0, 25, 0, 20),
            ),
            Container(
              child: 
              Text('Post on '+ model.datetime.substring(8,10)+'-'+model.datetime.substring(5,7)+'-'+ model.datetime.substring(0,4),
              textAlign: TextAlign.right,
              style: 
              TextStyle(fontSize: 20,
              ),
              ),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
            ),
            Container(
              child: 
              Text(model.isi,
              textAlign: TextAlign.justify,
              style: 
              TextStyle(fontSize: 20,
              ),
              ),
              margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
            ),
            Container(
              child: 
              Text('Made by '+model.penulis,
              textAlign: TextAlign.center,
              style: 
              TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold
              ),
              ),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
            ),
            ])
       );
   }
}
