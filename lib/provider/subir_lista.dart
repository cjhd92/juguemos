import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class SubirFijoCorrido {
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imxpc3Rlcm9fcHJ1ZWJhIiwic3ViIjoiYzcwNGRlMDItYzRmZS00YWI3LTkxZDgtNjZkMWVhNmE1YTM0IiwidHlwZSI6ImFjY2VzcyIsImV4cCI6MTY2NTQ2MzQzMiwiaWF0IjoxNjY1NDU5ODMyLCJqdGkiOiI5YzJjNjUyMC1hYWRmLTRiY2ItODI4MS0yMWNmNmRlYWJlYWIifQ.yZrsYfuDQpC9GQdsJRrEIz6W0BWBTrYlhH9uugltMMk";

  Future fijo_corrido(n, f, c) async {
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

    /*   Map<String, List<int>> data = {
      "idem_pk": [],
      "number": [2, 8],
      "corrido": [3, 9],
      "fijo": [4, 8],
    }; */

    Map<String, List<int>> data = {
      "idem_pk": [],
      "number": [],
      "corrido": [],
      "fijo": [],
    };

    data.addAll({
      "idem_pk": n,
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

    print('la respuesta ${json.decode(resp.body)}');
    print('la respuesta ${(resp.statusCode)}');

    /*  Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
    print(decodedResp); */

    /*   print("eeeeeee");
    print(json.decode(resp.body).toString()); */

    /*  var decodedResp = json.decode(resp.body);
    print("mi respuestaaaaaa");
    print(decodedResp); */

    /* print(Data);
    print(json.encode(Data)); */
  }
}
