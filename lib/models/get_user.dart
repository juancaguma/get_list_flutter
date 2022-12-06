import 'dart:convert';
import 'dart:io';

import 'package:list_tools/clases/reqres.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class ApiServiceUser {
  Future<List<Usuario>?> getUsers() async {
    try {
      String urlcrud = ApiConstants.baseUrl + ApiConstants.usersEndpoint;
      var url = Uri.parse(urlcrud);
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'x-token':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c3VhcmlvIjoxLCJpYXQiOjE2NzAzNDc3NDEsImV4cCI6MTY3MDQzNDE0MX0.MAChOZGwJ_GT2KPfaqYkjjBkee3oEekZWYqWU6ArLNQ',
      });
      final decodeData = json.decode(response.body);
      print(decodeData);
      final List<Usuario> usuarios = [];
      if (response.statusCode == 200) {
        if (decodeData == null) return [];
        for (var prod in decodeData['datos']) {
          final userTemp = Usuario.fromJson(prod);
          usuarios.add(userTemp);
        }
      }
      return usuarios;
    } catch (e) {
      return [];
    }
  }
}
