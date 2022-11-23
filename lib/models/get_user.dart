import 'package:list_tools/clases/reqres.dart';
import 'package:list_tools/constants/constants.dart';
import 'package:http/http.dart' as http;

class ApiServiceUser {
  Future<List<Usuario>?> getUsers() async {
    try {
      const String urlcrud = 'https://jsonplaceholder.typicode.com/users';
      var url = Uri.parse(urlcrud);
      var response = await http.get(url);
      print('BODY');
      print(response.body);
      if (response.statusCode == 200) {
        Usuario _model = usuarioFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }
}
