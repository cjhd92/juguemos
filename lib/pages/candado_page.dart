//import 'dart:html';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_data.dart';
import 'package:get/get.dart';

class Candado extends StatefulWidget {
  const Candado({super.key});

  static final String routeName = "candado";

  @override
  State<Candado> createState() => _CandadoState();
}

List<String> listaLLena = [];
List<String> candado = List<String>.filled(20, "");
List<bool> selecCandado = List<bool>.filled(20, false);
//List<bool> selecCandado = [false, false, false, false, false];

String apuesta = "";
bool selecA = false;
String number = "";
String numberTemp = "";
int item = 0;
String valor = "";
int elementosLista = 0;

final control = Get.find<Crontrol>();

/* 
String fijo = "";
String corrido = "";

bool selecN = false;
bool selecF = false;
bool selecC = false; */

class _CandadoState extends State<Candado> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "home");
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: Colors.white,
                ),
              ),
              Obx((() => Text(" ListDigital  (${control.userName})"))),
            ],
          ),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text("Jugar en candado"),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    icono(),
                    SizedBox(width: 10),
                    Container(
                        color: Colors.black12,
                        height: size.height * 0.25,
                        width: size.width * 0.25,
                        child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return inputCircularCandado(index);
                          },
                        )),
                    SizedBox(width: 15),
                    inputCircularApuesta(),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                _teclado()
              ],
            )));
  }

  Widget inputCircularApuesta() {
    return GestureDetector(
      onTap: () {
        selecA = true;
        selecCandado = selecCandado.map<bool>((v) => false).toList();
        setState(() {});
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecA == true ? Colors.blue : Colors.white,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(apuesta),
            ],
          )),
    );
  }

  Widget icono() {
    return IconButton(
      onPressed: null,
      icon: Icon(
        Icons.lock,
        size: 25,
        color: Colors.blue,
      ),
    );
  }

  Widget inputCircularCandado(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          //print(selecCandado);
          selecCandado = selecCandado.map<bool>((v) => false).toList();
          //print(index);
          //print(selecCandado);
          selecCandado[index] = true;
          // print(selecCandado);
          selecA = false;
          item = index;
          //print(item);
          valor = candado[item];
          //print("valor: $valor");

          setState(() {});
        },
        child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      selecCandado[index] == true ? Colors.blue : Colors.white,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(candado[index])],
            )),
      ),
    );
  }

  Widget _teclado() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 7,
                  onPressed: () {
                    setState(() {
                      _selecBtn("7");
                    });
                  },
                  child: Text(
                    "7",
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.blue,
                )),
            SizedBox(width: 18.0),
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 8,
                  onPressed: () {
                    setState(() {
                      _selecBtn("8");
                    });
                  },
                  child: Text(
                    "8",
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.blue,
                )),
            SizedBox(width: 18.0),
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 9,
                  onPressed: () {
                    setState(() {
                      _selecBtn("9");
                    });
                  },
                  child: Text(
                    "9",
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.blue,
                )),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 4,
                  onPressed: () {
                    setState(() {
                      _selecBtn("4");
                    });
                  },
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.blue,
                )),
            SizedBox(width: 18.0),
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 5,
                  onPressed: () {
                    setState(() {
                      _selecBtn("5");
                    });
                  },
                  child: Text(
                    "5",
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.blue,
                )),
            SizedBox(width: 18.0),
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 6,
                  onPressed: () {
                    setState(() {
                      _selecBtn("6");
                    });
                  },
                  child: Text(
                    "6",
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.blue,
                )),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 1,
                  onPressed: () {
                    setState(() {
                      _selecBtn("1");
                    });
                  },
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.blue,
                )),
            SizedBox(width: 18.0),
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 2,
                  onPressed: () {
                    setState(() {
                      _selecBtn("2");
                    });
                  },
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.blue,
                )),
            SizedBox(width: 18.0),
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 3,
                  onPressed: () {
                    setState(() {
                      _selecBtn("3");
                    });
                  },
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.blue,
                )),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 11,
                  onPressed: () {
                    setState(() {
                      _borrar();
                    });
                  },
                  child: Icon(Icons.arrow_back_rounded),
                  backgroundColor: Colors.blue,
                )),
            SizedBox(width: 18.0),
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 12,
                  onPressed: () {},
                  child: Text("."),
                  backgroundColor: Colors.blue,
                )),
            SizedBox(width: 18.0),
            Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue)),
                child: FloatingActionButton(
                  heroTag: 0,
                  onPressed: () {
                    setState(() {
                      _selecBtn("0");
                    });
                  },
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 22),
                  ),
                  backgroundColor: Colors.blue,
                )),
          ],
        ),
        SizedBox(height: 10),
        RaisedButton(
            child: Container(
              child: Container(
                width: 150.0,
                height: 42.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.save),
                    Text('Guardar jugadas'),
                  ],
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            elevation: 0.0,
            color: Colors.black,
            textColor: Colors.white,
            onPressed: habilitarBtn()
                ? () {
                    setState(() {
                      _reset();
                    });
                  }
                : null)
      ],
    );
  }

  void _selecBtn(String btn) {
    if (selecCandado[item]) {
      switch (item) {
        case 0:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 1:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }
          break;

        case 2:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 3:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 4:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 5:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 6:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 7:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 8:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 9:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 10:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 11:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 12:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 13:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 14:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 15:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 16:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 17:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 18:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;

        case 19:
          if (candado[item].length < 2) {
            candado[item] = candado[item] + btn;
          }

          break;
        default:
      }
    }

    if (selecA && apuesta.length < 5) {
      apuesta = apuesta + btn;
    }
  }

  void _borrar() {
    if (selecCandado[item]) {
      switch (item) {
        case 0:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 1:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 2:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 3:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 4:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 5:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 6:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 7:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 8:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 9:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 10:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 11:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 12:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 13:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 14:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 15:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 16:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 17:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 18:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;

        case 19:
          if (candado[item].length > 0) {
            candado[item] = candado[item];
            candado[item] =
                candado[item].substring(0, candado[item].length - 1);
          } else {
            candado[item] = "";
          }

          break;
        default:
      }
    }

    if (selecA && apuesta.length > 0) {
      apuesta = apuesta.substring(0, apuesta.length - 1);
    }
  }

  bool habilitarBtn() {
    /*  print("item ${item}");
    print("size candado completo contenido ${candado}");
    print("size candado  contenido especifico ${candado[item]}");
    print("size candado completo ${candado.length}");

    print("size listaLLena completo contenido ${listaLLena}");
    print("size listaLLena completo ${listaLLena.length}"); */
    print("size listaLLena completo ${listaLLena.length}");

    if (elementosLista >= 2 && apuesta.length > 0) {
      return true;
    }
    return false;
  }

  void _reset() {
    /* centena = "";
    apuesta = "";

    selecC = false;
    selecA = false; */
  }
}
