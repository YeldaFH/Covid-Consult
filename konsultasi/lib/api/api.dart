// ignore_for_file: unused_import

import 'dart:convert';
import 'package:forum/models/model.dart';
import 'package:http/http.dart' as http;
import 'package:covid_consult/common/network_service.dart';
import 'package:konsultasi/models/model.dart';

class GetProfile {
  Future<List<Profile>> getDoctorName() async {
    String url = "http://covid-consult-herokuapp.com/consultation/flutter-get-doctor";
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Profile> profile = [];
    for (var d in data) {
      if (d != null) {
        profile.add(Profile.fromJson(d));
      }
    }
    return profile;
  }
}


class ConsultationPatient {
  Future<List<Consultation>> getConsultationPatient() async {
    String url = "http://covid-consult-herokuapp.com/consultation/flutter-consultation-patient/";
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Consultation> consultation = [];
    for (var d in data) {
      if (d != null) {
        consultation.add(Consultation.fromJson(d));
      }
    }
    return consultation;
  }
}


class ConsultationDoctor {
  Future<List<Consultation>> getConsultationPatient() async {
    String url = "http://covid-consult-herokuapp.com/konsultasi/flutter-consultation-doctor/";
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<Consultation> consultation = [];
    for (var d in data) {
      if (d != null) {
        consultation.add(Consultation.fromJson(d));
      }
    }
    return consultation;
  }
}
