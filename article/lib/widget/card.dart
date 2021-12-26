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
        child: ExpansionTile(
          textColor: const Color.fromARGB(255, 208,170,243),
          iconColor:const Color.fromARGB(255, 208,170,243),
          title: Text(
                model.judul,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
          subtitle: Text(
                'Create by ' + model.penulis + ' on '+ date+'-'+month+'-'+year
              ),
         
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(model.isi),
            ),]
          // clipBehavior: Clip.antiAlias,
          // child: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: ExpansionTile(
          //     backgroundColor: Colors.white12,
          //     // Judul
              // title: Text(
              //   model.judul,
              //   style: const TextStyle(fontWeight: FontWeight.bold),
              // ),
              // subtitle: Text(
              //   'Create by ' + model.penulis + ' on '+ date+'-'+month+'-'+year
              // ),
          //     trailing: const SizedBox(),
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(
          //             top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
          //         child: Row(
          //           children: [
          //             Flexible(
          //               child: Text(
          //                 'isi: ' + model.isi ,
          //                 style:
          //                     TextStyle(color: Colors.black87.withOpacity(0.6)),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
    )
    ));
  }
}