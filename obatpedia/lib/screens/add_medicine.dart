// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unnecessary_this, no_logic_in_create_state, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:obatpedia/obatpedia.dart';
import 'package:covid_consult/common/network_service.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:image_picker/image_picker.dart';

class MedicineForm extends StatefulWidget {
  const MedicineForm({Key? key}) : super(key: key);

  @override
  AddMedicine createState() => AddMedicine();
}

class AddMedicine extends State<MedicineForm> {
  final _formKey = GlobalKey<FormState>();
  // final ImagePicker image_picker = ImagePicker();
  // late XFile? image;
  // late String base64Image;
  // late File tmpFile;
  late String base64image = "no image";
  String name = "";
  String description = "";
  String composition = "";
  String dosage_and_instructions = "";
  String side_effects = "";
  @override
  Widget build(BuildContext context){
    final request = context.watch<NetworkService>();
    return Scaffold(
        backgroundColor: Color(0xff131313),
        appBar: AppBar(
          title: Text('Add Medicine'),
          backgroundColor: Color(0xff131313),
        ),
        body: Form(
            key: _formKey,
            child: ListView(padding: EdgeInsets.all(16), children: [
                  Container(
                    child:
                    Text('Add New Medicine',textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 25, 0, 20),
                  ),
                  TextButton(
                    onPressed: () async {
                      var pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                      base64image = convert.base64Encode(await pickedImage!.readAsBytes());
                    },
                    child: const Text(
                      'Add Image',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Medicine Name',
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
                          labelText: 'Medicine Name'),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                        setState(() {
                          name = value!;
                        });
                      },
                      onChanged: (String? value) {
                        setState(() {
                          name = value!;
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
                      'Description',
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
                          labelText: 'Description'),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                        setState(() {
                          description = value!;
                        });
                      },
                      onChanged: (String? value) {
                        setState(() {
                          description = value!;
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
                      'Composition',
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
                          labelText: 'Composition'),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                        setState(() {
                          composition = value!;
                        });
                      },
                      onChanged: (String? value) {
                        setState(() {
                          composition = value!;
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
                      'Dosage and Instructions:',
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
                          labelText: 'Dosage and Instructions'),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                        setState(() {
                          dosage_and_instructions = value!;
                        });
                      },
                      onChanged: (String? value) {
                        setState(() {
                          dosage_and_instructions = value!;
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
                      'Side Effects:',
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
                          labelText: 'Side Effects'),
                      onSaved: (String? value) {
                        // This optional block of code can be used to run
                        // code when the user saves the form.
                        setState(() {
                          side_effects = value!;
                        });
                      },
                      onChanged: (String? value) {
                        setState(() {
                          side_effects = value!;
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
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(color: Color(0xff6B46C1),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton( onPressed: () async {
                      if (_formKey.currentState?.validate() ?? true) {
                        final response = await request.post(
                            "https://covid-consult.herokuapp.com/obatpedia/addMedicineFlutter",
                            convert.jsonEncode(<String, String>{
                              'base64image' : base64image,
                              'name': name,
                              'description' : description,
                              'composition': composition,
                              'dosage_instructions' : dosage_and_instructions,
                              'side_effects' : side_effects,
                            }));
                        if (response['status'] == 'success') {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => MyApp()));
                        }
                        // Navigator.push(context,MaterialPageRoute(builder: (_) =>MyApp()));
                      }

                    },
                      child:
                      Text( 'Submit',style: TextStyle(color: Colors.white,
                          fontSize: 25),
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  ),
                ]
            )
        )
    );
  }
}