// Taken from https://gist.github.com/Meta502/1605fdba3b141fbf67dba689e9e55498
// Taken from https://stackoverflow.com/questions/52241089/how-do-i-make-an-http-request-using-cookies-on-flutter/
// Taken from https://github.com/reflekt-io/echo/blob/main/lib/common/network_service.dart
// Thank you Athal

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class NetworkService {
  Map<String, String> headers = {};
  Map<String, String> cookies = {};
  final http.Client _client = http.Client();

  //sharedPreferences kayak local storage di web
  late SharedPreferences local; //diinisasiinya "telat" setelah inisiasi app

  bool loggedIn = false;
  bool initialized = false; //initialized cookies
  String username = "";
  String name = "";
  DateTime dob = DateTime.now();
  String email = "";
  String phoneNum = "";
  String role = "";
  String gender = "";

  // Future nunggu dulu data (async juga)
  Future init(BuildContext context) async {
    if (!initialized) {
      local = await SharedPreferences.getInstance();
      String? savedCookies = local.getString("cookies");
      if (savedCookies != null) {
        cookies = Map<String, String>.from(json.decode(savedCookies));
        if (cookies['sessionid'] != null) {
          loggedIn = true;
          headers['cookie'] = _generateCookieHeader();
        }
      }
    }
    initialized = true;
  }

  Future persist(String cookies) async {
    local.setString("cookies", cookies);
  }

  Future<dynamic> login(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }

    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);

    _updateCookie(response);

    if (response.statusCode == 200) {
      loggedIn = true;
      //ngambil uname dari sini pake request.username
      username = json.decode(response.body)['username'];
      name = json.decode(response.body)['name'];
      dob = DateTime.parse(json.decode(response.body)['dob']);
      email = json.decode(response.body)['email'];
      phoneNum = json.decode(response.body)['phone_num'];
      role = json.decode(response.body)['role'];
      gender = json.decode(response.body)['gender'];

      // print(username);
      // print(name);
      // print(dob);
      // print(email);
      // print(phoneNum);
      // print(role);
      // print(gender);
    } else {
      loggedIn = false;
    }

    return json.decode(response.body); // Expects and returns JSON request body
  }

  Future<dynamic> get(String url) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    http.Response response =
        await _client.get(Uri.parse(url), headers: headers);
    _updateCookie(response);
    return json.decode(response.body); // Expects and returns JSON request body
  }

  Future<dynamic> post(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);
    _updateCookie(response);
    return json.decode(response.body); // Expects and returns JSON request body
  }

  Future<dynamic> postJson(String url, dynamic data) async {
    if (kIsWeb) {
      dynamic c = _client;
      c.withCredentials = true;
    }
    // Add additional header
    headers['Content-Type'] = 'application/json; charset=UTF-8';
    http.Response response =
        await _client.post(Uri.parse(url), body: data, headers: headers);
    // Remove used additional header
    headers.remove('Content-Type');
    _updateCookie(response);
    return json.decode(response.body); // Expects and returns JSON request body
  }

  void _updateCookie(http.Response response) {
    String? allSetCookie = response.headers['set-cookie'];

    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
      String cookieObject = (const JsonEncoder()).convert(cookies);
      persist(cookieObject);
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.isNotEmpty) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;

        cookies[key] = value;
      }
    }
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys) {
      if (cookie.isNotEmpty) cookie += ";";
      String? newCookie = cookies[key];
      cookie += '$key=$newCookie';
    }

    return cookie;
  }

  Future<dynamic> logoutAccount(String url) async {
    http.Response response = await _client.post(Uri.parse(url));

    if (response.statusCode == 200) {
      loggedIn = false;
      username = "";
    } else {
      loggedIn = true;
    }

    cookies = {};

    return json.decode(response.body);
  }
}
