import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Crontrol extends GetxController {
  var userName = "".obs;
  var userPass = "".obs;
  var sumaTotal = 0.obs;
  var id_pk = 10000.obs;

  List<int> number = <int>[].obs;
  List<int> corrido = <int>[].obs;
  List<int> fijo = <int>[].obs;
  List<int> numberP1 = <int>[].obs;
  List<int> numberP2 = <int>[].obs;
  List<int> betP = <int>[].obs;
  List<String> selecjugada = <String>[].obs;
  List<int> idem_pks = <int>[].obs;
  List<int> idem_pkp = <int>[].obs;

/*   var limiteFijo = 0.obs;
  var limiteCorrido = "".obs;
  var limiteCentena = "".obs;
  var limiteParle = "".obs; */

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

/*   Map<String, List<String>> listaSinConexion = {
    "numeros": ["22", "23", "24"].obs,
    "fijos": ["11", "12", "13"].obs,
    "corridos": ["15", "2", "35"].obs,
  }; */

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

/*   getlimiteFijo(lf) {
    limiteFijo = lf;
  } */

  setSelecJugada(String letra) {
    selecjugada.add(letra);
    print(selecjugada);
  }

  setIdemPks(int ik) {
    idem_pks.add(ik);
  }

  setIdemPkp(int ik) {
    idem_pkp.add(ik);
  }

  setnumber(numero) {
    number.add(int.parse(numero));
    /* print("lista de numeros ${number}"); */
  }

  setfijo(f) {
    fijo.add(int.parse(f));
    /*  print("lista de los fijo ${fijo}"); */
  }

  setcorrido(c) {
    corrido.add(int.parse(c));
    /*  print("lista de los corrido ${corrido}") */;
  }

  setParle(np1, np2, b) {
    numberP1.add(int.parse(np1));
    numberP2.add(int.parse(np2));
    betP.add(int.parse(b));
  }

  sumarApuesta(int suma) {
/*     int totalSumaFijo = 2;
    int totalSumaCorrido = 3; */

    if (number.isNotEmpty) {
/*       for (int f = 0; f <= fijo.length; f++) {
        totalSumaFijo = fijo[f] + totalSumaFijo;
        print(totalSumaFijo);
      } */

      /*   for (int c = 0; c <= corrido.length; c++) {
        totalSumaCorrido = int.parse(corrido[c]) + totalSumaCorrido;
      }
 */
      sumaTotal.value = sumaTotal.value + suma;
      /* suma.value = totalSumaFijo + totalSumaCorrido; */
    } else {
      sumaTotal.value = 0;
    }
  }
}
