import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class SubirLista {
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imxpc3Rlcm9fcHJ1ZWJhIiwic3ViIjoiYzcwNGRlMDItYzRmZS00YWI3LTkxZDgtNjZkMWVhNmE1YTM0IiwidHlwZSI6ImFjY2VzcyIsImV4cCI6MTY2NTU1MDQ5NSwiaWF0IjoxNjY1NTQ2ODk1LCJqdGkiOiJlZmJhOGNlYS1kYTMxLTQ2N2UtYjcyOC03YTg1NThjYmVlMDAifQ.vPvxUMepdbpOCM4b6BpJ8taeHKJGth77OJ2G3hNFJu4";

  Future fijo_corrido(id, n, f, c) async {
    /* var httpsUri = Uri(
      scheme: 'http',
      host: '152.206.118.224',
      path: 'belts/fijo_corrido',
    ); */

    var httpsUri = Uri(
      scheme: 'https',
      host: 'srv224118-206152.vps.etecsa.cu',
      path: 'bets/fijo_corrido',
    );

    Map<String, List<int>> data = {
      "idem_pk": [],
      "number": [],
      "corrido": [],
      "fijo": [],
    };

    data.addAll({
      "idem_pk": id,
      "number": n,
      "corrido": c,
      "fijo": f,
    });
    /*   var data = {
      "idem_pk": [1, 5],
      "number": [2, 8],
      "corrido": [3, 9],
      "fijo": [4, 8],
    }; */

/* 
    data.addAll({
      "idem_pk": [1],
      "number": [2],
      "corrido": [3],
      "fijo": [4],
    }); */

    //print(httpsUri);

    final resp = await http.post(
      httpsUri,
      body: jsonEncode(data),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${token}",
        "Content-Type": "application/json"
      },
    );

    //  print('la respuesta fijo_corrido ${json.decode(resp.body)}');
    print('la respuesta fijo_corrido ${(resp.statusCode)}');
  }

  Future subir_parle(id, b, n1, n2) async {
    var httpsUri = Uri(
      scheme: 'https',
      host: 'srv224118-206152.vps.etecsa.cu',
      path: 'bets/parle',
    );

    Map<String, List<int>> data = {
      "idem_pk": [],
      "bet": [],
      "number1": [],
      "number2": [],
    };

    data.addAll({
      "idem_pk": id,
      "bet": b,
      "number1": n1,
      "number2": n2,
    });

    print("la data del parle");
    print(data);

    final resp = await http.post(
      httpsUri,
      body: jsonEncode(data),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${token}",
        "Content-Type": "application/json"
      },
    );
    print('la respuesta parle ${(resp.statusCode)}');

    /*   if (resp.statusCode == "200") {
      print('la respuesta parle ${json.decode(resp.body)}');
      print('la respuesta parle ${(resp.statusCode)}');
    } else {
      print("no es 200");
    } */
  }
}
