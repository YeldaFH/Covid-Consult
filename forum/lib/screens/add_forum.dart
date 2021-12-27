// import 'package:covid_consult/widgets/main_drawer.dart';
import 'package:covid_consult/cookie/CookieRequest.dart';
import 'package:flutter/material.dart';
import 'package:forum/api/api.dart';
import 'package:forum/forum.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
// import 'package:forum/models/model.dart';
// import 'package:intl/intl.dart';

// ignore: camel_case_types
class AddForum extends StatefulWidget {
  @override
  Add_Forum createState() => Add_Forum();
}

class Add_Forum extends State<AddForum> {
  final _formKey = GlobalKey<FormState>();
  final _categories = ['General Discussion', 'Covid Info', 'Drug Info'];
  PostForum postForum = PostForum();
  // Saved variables to be submitted
  String _title = "";
  String _content = "";
  String _category = "";
  String? _value;
  DropdownMenuItem<String> buildMenuItem(String value) =>
      DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: const TextStyle(color: Colors.white),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      appBar: AppBar(
        title: const Text("Add Forum"),
        backgroundColor: const Color.fromRGBO(27, 27, 27, 1),
      ),
      // drawer: const MainDrawer(),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Discussion',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                'by user1',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              // TextField(),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Title Discussion",
                  labelText: "Title Discussion",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _title = value!;
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    _title = value!;
                  });
                },
                validator: (String? value) {
                  return (value == null || value.isEmpty)
                      ? 'Please fill out this field.'
                      : null;
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  hint: const Text(
                    "*Choose Category Discussion*",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  value: _value,
                  items: _categories.map((String value) {
                    return buildMenuItem(value);
                  }).toList(),
                  onChanged: (String? value) => setState(() {
                        if(value != null) {
                          if(value == "General Discussion") {
                            _category = 'general';
                          } else if(value == "Covid Info") {
                            _category = 'covid';
                          } else if(value == "Drug Info") {
                            _category = 'drug';
                          }
                        }
                    value = value as String;
                  }),
                  onSaved: (String? value) {
                    setState(() {
                      value = value!;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please fill out this field.' : null,
                ),
              ),

              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Write Here",
                  labelText: "Write Here",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _content = value!;
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    _content = value!;
                  });
                },
                maxLines: 6,
                validator: (String? value) {
                  return (value == null || value.isEmpty)
                      ? 'Please fill out this field.'
                      : null;
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ignore: deprecated_member_use
                    RaisedButton(
                      child: const Text("Post to Forum"),
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? true) {
                          final response = await request.postJson(
                            'http://10.0.2.2:8000/forum/postNewForum/',
                            convert.jsonEncode(<String, String>{
                              'judul': _title,
                              'isi': _content,
                              'kategori': _category,
                            }),
                          );
                          if (response['status'] == 'success') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MainForum(
                                        title: 'Forum',
                                        currentCategory: 'All Category')));
                          }
                        }
                      },
                      color: const Color(0xff6B46C1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                            color: Color(0xff6B46C1),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
