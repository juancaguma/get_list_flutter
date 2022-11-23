import 'dart:convert';

import 'package:list_tools/clases/reqres.dart';
import 'package:http/http.dart' as http;

class ApiServiceUser {
  Future<List<Usuario>?> getUsers() async {
    try {
      const String urlcrud = 'https://reqres.in/api/users?page=1';
      var url = Uri.parse(urlcrud);
      var response = await http.get(url);
      final decodeData = json.decode(response.body);
      print(decodeData['data']);
      final List<Usuario> usuarios = [];
      if (response.statusCode == 200) {
        if (decodeData == null) return [];
        for (var prod in decodeData['data']) {
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
