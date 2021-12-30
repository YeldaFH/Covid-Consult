import 'dart:convert';
import 'package:forum/models/model.dart';
import 'package:http/http.dart' as http;
import 'package:covid_consult/common/network_service.dart';
import 'package:konsultasi/models/model.dart';


class ConsultationPatient {
  Future<List<Post>> getConsultationPatient() async {
    String url = "http://covid-consult-herokuapp.com/konsultasi/flutter-consultation-patient/";
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Consultation> entry;

  }
}