import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class UsuarioProvider {
  Future login(String username, String password) async {
    /*    var httpsUri = Uri(
      scheme: 'http',
      host: '152.206.118.224',
      path: 'auth/get_user_token',
   
    ); */

    var httpsUri = Uri(
      scheme: 'https',
      host: 'srv224118-206152.vps.etecsa.cu',
      path: 'auth/get_user_token',
    );

/*     final authData = {
      'grant_type': "",
      'username': email,
      'password': password,
     
    }; */

    /*    Map<String, String> authData = {
      'username': 'prueba_listero',
      'password': 'admin1234',
      'grant_type': 'password'
    }; */

    Map<String, String> authData = {
      'username': '',
      'password': '',
      /*     'username': 'listero_prueba',
      'password': 'admin1234', */
      'grant_type': 'password'
    };
    /*  print("inicio");
    print(body); */

    /*   print(username);
    print(password); */

    authData.addAll({
      'username': username,
      'password': password,
    });

    /*   print("fin");
    print(authData); */

    final resp = await http.post(
      httpsUri,
      body: authData,
    );

    //print(httpsUri);

    /*  final resp = await http.post(
      httpsUri,
      body: json.encode(authData),
      /*  headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8") */
    ); */

    //print(json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    //Map<String, dynamic> decodedResp = json.decode(resp.body);

    print(decodedResp);
    //print("LLegue");

    if (decodedResp.containsKey('access_token')) {
      //Salvar el token en el store
/*       print("ssiiiisiisss");
      print("ssiiiisiisss"); */
      return {'ok': true, 'token': decodedResp['access_token']};
    } else {
      return {'ok': false};
    }
  }
}
