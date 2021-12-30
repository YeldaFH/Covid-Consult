// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'article.dart';
import 'package:covid_consult/common/network_service.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

// ignore: use_key_in_widget_constructors
class BelajarForm extends StatefulWidget {
  @override
  Add_Article createState() => Add_Article();
}

// ignore: camel_case_types
class Add_Article extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();
  String penulis = "";
  String judul = "";
  String isi = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Scaffold(
        backgroundColor: Color(0xff131313),
        appBar: AppBar(
          title: Text('Article'),
          backgroundColor: Color(0xff131313),
        ),
        body: Form(
            key: _formKey,
            child: ListView(padding: EdgeInsets.all(16), children: [
              Container(
                child: Text(
                  'Add New Article',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.fromLTRB(0, 25, 0, 20),
              ),
              Container(
                child: Text(
                  'Authors Name',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Authors Name'),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                    setState(() {
                      penulis = value!;
                    });
                  },
                  onChanged: (String? value) {
                    setState(() {
                      penulis = value!;
                    });
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              Container(
                child: Text(
                  'Title',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Title'),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                    setState(() {
                      judul = value!;
                    });
                  },
                  onChanged: (String? value) {
                    setState(() {
                      judul = value!;
                    });
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'judul tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              ),
              Container(
                child: Text(
                  'Article Content',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
              ),
              Container(
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Content'),
                  minLines: 14,
                  maxLines: null,
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                    setState(() {
                      isi = value!;
                    });
                  },
                  onChanged: (String? value) {
                    setState(() {
                      isi = value!;
                    });
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'konten tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color(0xff6B46C1),
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? true) {
                      final response = await request.post(
                          "https://covid-consult.herokuapp.com/article/addArtikelFlutter",
                          convert.jsonEncode(<String, String>{
                            'penulis': penulis,
                            'judul': judul,
                            'isi': isi,
                          }));
                      if (response['status'] == 'success') {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => MyApp()));
                      }
                      // Navigator.push(context,MaterialPageRoute(builder: (_) =>MyApp()));
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
              ),
            ])));
  }
}
