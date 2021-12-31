// ignore_for_file: must_be_immutable, prefer_const_constructors, no_logic_in_create_state, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unnecessary_this, unused_element
import 'package:covid_consult/common/network_service.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
// import 'package:forum/screens/add_reply.dart';
import 'package:forum/screens/add_reply_search.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:forum/api/api.dart';
import 'package:forum/models/model.dart';
import 'dart:convert' as convert;
import '../forum.dart';

// ignore: camel_case_types
class DetailForumSearch extends StatefulWidget {
  var dataForum;
  DetailForumSearch(this.dataForum);
  @override
  State<StatefulWidget> createState() {
    return DetailForumSearchState(this.dataForum);
  }
}

class DetailForumSearchState extends State<DetailForumSearch> {
  var dataForum;
  String _comment = "";
  CommentForumService commentService = CommentForumService();
  ReplyCommentForumService replyService = ReplyCommentForumService();

  DetailForumSearchState(this.dataForum);
  final _formKey = GlobalKey<FormState>();

  void _processData() {
    // Process your data and upload to server
    _formKey.currentState?.reset();
  }

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
          backgroundColor: HexColor(dataForum['warna']),
          foregroundColor: Colors.black,
          radius: 25,
          child: Text(
            dataForum['namaPenulis'][0].toUpperCase(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Text(
            dataForum['judul'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          margin: const EdgeInsets.fromLTRB(0, 25, 0, 3),
        ),
        Container(
          child: Text(
            dataForum['namaPenulis'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        ),
        Container(
          child: Text(
            dataForum['isi'],
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        ),
        Container(
          child: const Text(
            'Comment Here',
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
                    hintText: "Title Discussion",
                    labelText: "Title Discussion",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _comment = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _comment = value!;
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
                            var data = dataForum['id'];
                            String url =
                                "https://covid-consult.herokuapp.com/forum/commentNewForum/$data/";
                            final response = await request.postJson(
                              url,
                              convert.jsonEncode(<String, String>{
                                'isi': _comment,
                              }),
                            );
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Successfully created comment!"),
                              ));
                              setState(() {
                                _comment = "";
                              });
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          DetailForumSearch(dataForum)));
                            } else {
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
                              'Post to Comment',
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
        FutureBuilder<List<Comment>>(
          future: commentService.getComment(dataForum['id']),
          builder: (context, snapshot) {
            // print(snapshot);
            if (snapshot.hasData) {
              final List<Comment>? comment = snapshot.data;
              if (comment?.isNotEmpty ?? false) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: comment?.length,
                    itemBuilder: (context, index) {
                      return buildCommentItem(comment![index]);
                    });
              } else {
                return const Text("0 Comment");
              }
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ]),
    );
  }

  Widget buildCommentItem(Comment komen) {
    var day = komen.dateTime.substring(8, 10);
    var month = komen.dateTime.substring(5, 7);
    var year = komen.dateTime.substring(0, 4);
    var time = komen.dateTime.substring(11, 16);
    var dateTime = day + '-' + month + '-' + year + ' || ' + time + ' WIB';
    var temp = komen.isi;
    if (temp.length > 20) {
      temp = komen.isi.substring(0, 20) + "...";
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ExpansionTile(
              textColor: const Color.fromARGB(255, 208, 170, 243),
              iconColor: const Color.fromARGB(255, 208, 170, 243),
              title: Text(
                komen.namaPenulis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                backgroundColor: HexColor(komen.warna),
                foregroundColor: Colors.black,
                radius: 25,
                child: Text(
                  komen.namaPenulis[0].toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(
                  dateTime + "\n" + temp + '\nReply: ' + komen.jumlahReply),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(komen.isi),
                ),
                FutureBuilder<List<Reply>>(
                  future: replyService.getReply(komen.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<Reply>? reply = snapshot.data;
                      if (reply?.isNotEmpty ?? false) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: reply?.length,
                            itemBuilder: (context, index) {
                              return buildReplyItem(reply![index]);
                            });
                      } else {
                        return const Text("0 Reply");
                      }
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AddReplySearch(komen, dataForum)));
                },
                child: const Text('Reply')),
          ],
        ),
      ),
    );
  }

  Widget buildReplyItem(Reply reply) {
    var day = reply.dateTime.substring(8, 10);
    var month = reply.dateTime.substring(5, 7);
    var year = reply.dateTime.substring(0, 4);
    var time = reply.dateTime.substring(11, 16);
    var dateTime = day + '-' + month + '-' + year + ' || ' + time + ' WIB';
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundColor: HexColor(reply.warna),
        foregroundColor: Colors.black,
        radius: 25,
        child: Text(
          reply.namaPenulis[0].toUpperCase(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(reply.namaPenulis + '\n' + dateTime),
      subtitle: Text(reply.isi),
    );
  }
}
