import 'dart:html';

import 'package:flutter/material.dart';
import 'package:obatpedia/models/model.dart';

class medicineDetails extends StatelessWidget {
  MedicineModel model;
  medicineDetails(this.model);
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Color(0xff131313),
        appBar: AppBar(
          title: Text('Medicine'),
          backgroundColor: Color(0xff131313),
        ),
        body: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Image(
                image: NetworkImage('https://covid-consult.herokuapp.com/media/' + model.image,
                ),
              ),
              Container(
                child:
                Text(model.name,textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.fromLTRB(0, 25, 0, 20),
              ),
              Text("Description: ",
                textAlign: TextAlign.justify,
                style:
                TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(model.description,
                textAlign: TextAlign.justify,
                style:
                TextStyle(fontSize: 20,
                ),
              ),
              Text("Composition: ",
                textAlign: TextAlign.justify,
                style:
                TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(model.composition,
                textAlign: TextAlign.justify,
                style:
                TextStyle(fontSize: 20,
                ),
              ),
              Text("Side Effects: ",
                textAlign: TextAlign.justify,
                style:
                TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(model.sideEffects,
                textAlign: TextAlign.justify,
                style:
                TextStyle(fontSize: 20,
                ),
              ),
              Text("Dosage & Instructions: ",
                textAlign: TextAlign.justify,
                style:
                TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(model.dosageInstructions,
                textAlign: TextAlign.justify,
                style:
                TextStyle(fontSize: 20,
                ),
              ),
            ])
    );
  }
}