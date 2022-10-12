import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_1/models/rules_model.dart';
import 'package:http/http.dart' as http;

class RulesProvider {
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imxpc3Rlcm9fcHJ1ZWJhIiwic3ViIjoiYzcwNGRlMDItYzRmZS00YWI3LTkxZDgtNjZkMWVhNmE1YTM0IiwidHlwZSI6ImFjY2VzcyIsImV4cCI6MTY2NTU1MDQ5NSwiaWF0IjoxNjY1NTQ2ODk1LCJqdGkiOiJlZmJhOGNlYS1kYTMxLTQ2N2UtYjcyOC03YTg1NThjYmVlMDAifQ.vPvxUMepdbpOCM4b6BpJ8taeHKJGth77OJ2G3hNFJu4";

  /* String token = 'g7d6tbw86qt84f.qfi4itbf6c4t67.f436bf7fybwe98t7';
  String header = 'Bearer '; */

  Future rules() async {
    var httpsUri = Uri(
      scheme: 'https',
      //host: '152.206.118.224',
      host: 'srv224118-206152.vps.etecsa.cu',
      path: 'structure/get_current_rules',
    );

    var resp = await http.get(
      httpsUri,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );

    var body = jsonDecode(resp.body);

    print("la respuesta sss");
    print(body);
    print(body["lista"]);

    /*   print("la respuesta");
    print(resp.body); */

    return body;
  }

  Future rulesSesion() async {
    var httpsUriRulesSesion = Uri(
      scheme: 'http',
      host: 'srv224118-206152.vps.etecsa.cu',
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
    /*    print("la respuesta2");
    print(resp.body); */
  }

  Future listOpen() async {
    var httpsUriRulesSesion = Uri(
      scheme: 'https',
      host: 'srv224118-206152.vps.etecsa.cu',
      //host: '152.206.118.224',
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
    /*   print("la respuesta3");
    print(resp.body); */
  }
}
