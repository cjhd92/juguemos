import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class RulesProvider {
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imxpc3Rlcm9fcHJ1ZWJhIiwic3ViIjoiYzcwNGRlMDItYzRmZS00YWI3LTkxZDgtNjZkMWVhNmE1YTM0IiwidHlwZSI6ImFjY2VzcyIsImV4cCI6MTY2NDg5MzYyOSwiaWF0IjoxNjY0ODkwMDI5LCJqdGkiOiJlZmJkMDY3Ny02ZDEyLTQ4ZWUtYTdhNi02MjUzYjY1NGJjN2IifQ.s7i_aCWqUnV0nw88GjHXzqrijkPnOxHdo8JxrWZsHlg";

  /* String token = 'g7d6tbw86qt84f.qfi4itbf6c4t67.f436bf7fybwe98t7';
  String header = 'Bearer '; */

  Future rules() async {
    var httpsUri = Uri(
      scheme: 'http',
      host: '152.206.118.224',
      path: 'structure/get_current_rules',
    );

    var resp = await http.get(
      httpsUri,
      //headers: {"Bearer": token},
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    print("la respuesta");
    print(resp.body);
  }

  Future rulesSesion() async {
    var httpsUriRulesSesion = Uri(
      scheme: 'http',
      host: '152.206.118.224',
      path: 'structure/get_session_rules',
      queryParameters: {"session": "night"},
    );

    var resp = await http.get(
      httpsUriRulesSesion,
      //headers: {"Bearer": token},
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    print("la respuesta2");
    print(resp.body);
  }

  Future listOpen() async {
    var httpsUriRulesSesion = Uri(
      scheme: 'http',
      host: '152.206.118.224',
      path: 'structure/open_lista',
    );

    var resp = await http.get(
      httpsUriRulesSesion,
      //headers: {"Bearer": token},
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );
    print("la respuesta3");
    print(resp.body);
  }
}
