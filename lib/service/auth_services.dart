import 'dart:convert';

import 'package:app_fluttr/service/globals.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future Login(String email, String motPs) async {
    Map data = {
      "email": email,
      "motPs": motPs,
    };
    print("object");

    var body = json.encode(data);
    print(body);
    print(baseURL);

    var url = Uri.parse('${baseURL}auth/login');

    http.Response response = await http.post(
      url,
      headers: headers,
      body: data,
    );

    print('response');
    print(response.body);
    return json.decode(response.body);
  }

  static Future<List<dynamic>> getPlanningsByAgent(id) async {
    final response = await http.get(Uri.parse("${baseURL}plannings/$id"),
        headers: headers); // Utilisez l'identifiant de l'agent dans l'URL
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("plannings");
      print(data[
          'plannings']); // Utilisez la clé "plannings" pour récupérer les données
      return data['plannings'];
    } else {
      throw Exception('Erreur lors de la récupération des plannings');
    }
  }

  Future<void> afficherUtilisateur() async {
    var id;
    final response =
        await http.get(Uri.parse("${baseURL}/profile/$id"), headers: headers);
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;

      // Faites quelque chose avec les données (par exemple, les afficher dans l'interface utilisateur)
    } else {
      // Gérez l'erreur de réponse (par exemple, afficher un message d'erreur)
      throw Exception('Erreur lors de la récupération des prfiiiii');
    }
  }
}
