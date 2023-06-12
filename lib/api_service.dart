import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceAPI {
  //lokasi api json file
  static const String _baseUrl = 'https://jsonplacehoplder.typicode.com';

  //untuk mengambil value yg adanya nanti, (terhalang, jaringan load time /saat ini value blm ada)maka pakai fluter
  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('$_baseUrl/photos'));

    //karena menggunakan http, maka kita tangkap saja statuscode dari http-nya
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal load');
    }
  }
}
