import 'dart:convert';

import 'package:list_tools/clases/reqres.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class ApiServiceUser {
  Future<List<Usuario>?> getUsers() async {
    try {
      String urlcrud = ApiConstants.baseUrl + ApiConstants.usersEndpoint;
      var url = Uri.parse(urlcrud);
      var response = await http.get(url);
      final decodeData = json.decode(response.body);
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
