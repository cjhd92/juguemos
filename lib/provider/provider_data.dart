import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Crontrol extends GetxController {
  var userName = "".obs;
  var userPass = "".obs;

/*     Map<String, RxString> jugadaSimple = {
    
    "numero": "".obs,
    "fijo": "".obs,
    "corrido": "".obs
  }; */

/*   Map<String, List<String>> listaSinConexion = {
    "1": ["s", "22", "50", "30"].obs,
    "2": ["c", "11", "21", "31"].obs,
    "3": ["c", "15", "2", "35"].obs,
  }; */

  Map<String, List<String>> listaSinConexion = {
    "numeros": ["22", "23", "24"].obs,
    "fijos": ["11", "12", "13"].obs,
    "corridos": ["15", "2", "35"].obs,
  };

  getUser(String name) {
    userName.value = name;
  }

  getPass(String pass) {
    userPass.value = pass;
  }

  getJugada(String jugada) {
    //int sizeList = listaSinConexion.length + 1;

    //print(jugada);
    //print(listaSinConexion);
    final v = <String>[];
    v.add("2");

    /*  listaSinConexion({"numeros": v}); */

    /*   listaSinConexion.addAll({
      "numeros": 
    }); */

    //print(listaSinConexion);
    //print(listaSinConexion.length);
  }
}
