import 'package:covid_consult/common/network_service.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:forum/screens/detail_forum.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:forum/api/api.dart';
import 'package:forum/models/model.dart';
import 'dart:convert' as convert;
import '../forum.dart';

// ignore: camel_case_types
class AddReply extends StatefulWidget {
  var komen;
  var dataForum;
  AddReply(this.komen, this.dataForum);
  @override
  State<StatefulWidget> createState() {
    return AddReplyState(this.komen, this.dataForum);
  }
}

class AddReplyState extends State<AddReply> {
  CommentForumService commentService = CommentForumService();
  var komen;
  var dataForum;
  String _reply = "";

  AddReplyState(this.komen,this.dataForum);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<NetworkService>();
    return Scaffold(
      backgroundColor: const Color(0xff131313),
      appBar: AppBar(
        title: const Text('Forum'),
        backgroundColor: const Color(0xff131313),
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: <Widget>[
        CircleAvatar(
          backgroundColor: HexColor(komen.warna),
          foregroundColor: Colors.black,
          radius: 25,
          child: Text(
            komen.namaPenulis[0].toUpperCase(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Text(
            komen.namaPenulis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        ),
        Container(
          child: Text(
            komen.isi,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        ),
        Container(
          child: const Text(
            'Create your Reply below',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        ),
        const SizedBox(height: 10),
        Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Reply Here",
                    labelText: "Reply Here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _reply = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _reply = value!;
                    });
                  },
                  maxLines: 3,
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
                       BouncingWidget(
                        scaleFactor: 1.5,
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? true) {
                            var data = komen.id;
                            // print(data);
                            String url =
                                "http://covid-consult.herokuapp.com/forum/replyCommentNewForum/$data/";
                            // print(url);
                            final response = await request.postJson(
                              url,
                              convert.jsonEncode(<String, String>{
                                'isi': _reply,
                              }),
                            );
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Successfully created reply!"),
                              ));
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetailForum(dataForum)));
                            }
                            else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text("An error occured, please try again."),
                              ));
                            }
                          }
                        },
                        
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.0),
                            color: const Color(0xff6B46C1),
                          ),
                          child: const Center(
                            child: Text(
                              'Post to Reply',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
