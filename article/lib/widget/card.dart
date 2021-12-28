import 'package:article/detailArticle.dart';
import 'package:flutter/material.dart';
import 'package:article/models/model.dart';

class ArtikelCard extends StatelessWidget {
  final Model model;
  const ArtikelCard(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String year = model.datetime.substring(0,4);
    String month = model.datetime.substring(5,7);
    String date = model.datetime.substring(8,10);
    return Container(
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
                'Create by ' + model.penulis + ' on '+ date+'-'+month+'-'+year
              ),
          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Details(model))),
                          trailing: const Icon(Icons.read_more),
                        ),
          
    )
    );
  }
}