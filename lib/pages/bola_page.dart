import 'dart:math';
import 'package:flutter_application_1/provider/provider_data.dart';
import 'package:flutter_application_1/util/util.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bola extends StatefulWidget {
  const Bola({super.key});

  static final String routeName = "bola";

  @override
  State<Bola> createState() => _BolaState();
}

class _BolaState extends State<Bola> {
  String number = "";
  String fijo = "";
  String corrido = "";
  int idem_pk = 10000;

  bool selecN = false;
  bool selecF = false;
  bool selecC = false;

  //List<String> numeros = [];
  /* List<String> fijos = [];
  List<String> corridos = []; */

  final control = Get.find<Crontrol>();

  Map<String, String> datos = {
    //"key": "",
    "numero": "",
    "fijo": "",
    "corrido": ""
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //var userInClass = Provider.of<ProviderData>(context, listen: false).user;
    //Provider.of<ProviderData>(context).user = userInClass;

    ///userInClass = context.read<ProviderData>().user;
    //context.read<ProviderData>().user = userInClass;

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
            Obx((() => Text(" ListDigital  ${control.userName}"))),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Text(
              "Jugar Bola",
              style: TextStyle(
                  color: Color.fromRGBO(33, 150, 243, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "Juega tu número preferido fijo o corrido",
              style: TextStyle(color: Color.fromRGBO(33, 150, 243, 0.8)),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _texto("Numero"),
                SizedBox(width: 15.0),
                _texto("Fijo"),
                SizedBox(width: 15.0),
                _texto("Corrido"),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                inputCircularNumber(),
                SizedBox(width: 12.0),
                inputCircularFijo(),
                SizedBox(width: 12.0),
                inputCircularCorrido(),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
                height: size.height * 0.6,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _teclado(),
                  ],
                )))
          ],
        ),
      ),
      floatingActionButton: _crearBotones(context),
    );
  }

  Widget _texto(String text) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Color.fromARGB(
            255,
            33,
            150,
            235,
          )),
    );
  }

  Widget _fila() {
    return Container(
        width: 40,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            /* setState(() {
                  _coloresClickBoton(false, false, true);
                }); */
          },
          child: Text(
            fijo,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          //backgroundColor: selecF == true ? Colors.black : Colors.white,
        ));
  }

  Widget inputCircularNumber() {
    return GestureDetector(
      onTap: () {
        selecN = true;
        selecF = false;
        selecC = false;

        setState(() {});
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecN == true ? Colors.blue : Colors.white,
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
              Text(number),
            ],
          )),
    );
  }

  Widget inputCircularFijo() {
    return GestureDetector(
      onTap: () {
        selecN = false;
        selecF = true;
        selecC = false;
        setState(() {});
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecF == true ? Colors.blue : Colors.white,
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
              Text(fijo),
            ],
          )),
    );
  }

  Widget inputCircularCorrido() {
    return GestureDetector(
      onTap: () {
        selecN = false;
        selecF = false;
        selecC = true;
        setState(() {});
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecC == true ? Colors.blue : Colors.white,
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
              Text(corrido),
            ],
          )),
    );
  }

  void _selecBtn(String btn) {
    if (selecN && number.length < 2) {
      number = number + btn;
    } else {
      print("numero supera mas de dos digitos $number");
    }
    if (selecF && fijo.length < 5) {
      fijo = fijo + btn;
    } else {
      print(" fijo supera mas de dos digitos $fijo");
    }

    if (selecC && corrido.length < 5) {
      corrido = corrido + btn;
    } else {
      print(" corrido supera mas de dos digitos $corrido");
    }
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
                      //_validarReglas();
                      _generarKey();
                      //jugada.add("s");
                      //numeros.add(number);

                      /*   print("numero añadido ${number}");
                      print("fijo añadido ${fijo}");
                      print("corrrido añadido ${corrido}"); */
                      control.id_pk.value++;

                      control.setIdemPks(control.id_pk.value);

                      control.setnumber(number);

                      if (fijo.length == 0) {
                        control.setfijo("0");
                        fijo = "0";
                      } else {
                        control.setfijo(fijo);
                      }

                      if (corrido.length == 0) {
                        control.setcorrido("0");
                        corrido = "0";
                      } else {
                        control.setcorrido(corrido);
                      }

                      _suma(fijo, corrido);
                      control.setSelecJugada("s");

                      /* fijos.add(fijo);
                      corridos.add(corrido); */

                      //control.getJugada(number);
                      /* control.getJugada(fijos);
                      control.getJugada(corridos); */
                      _reset();
                    });
                  }
                : null)
      ],
    );
  }

  void _borrar() {
    if (selecN) {
      if (number.length > 0) {
        number = number.substring(0, number.length - 1);
      } else {
        number = "";
      }
    }

    if (selecF) {
      if (fijo.length > 0) {
        fijo = fijo.substring(0, fijo.length - 1);
      } else {
        fijo = "";
      }
    }

    if (selecC) {
      if (corrido.length > 0) {
        corrido = corrido.substring(0, corrido.length - 1);
      } else {
        corrido = "";
      }
    }
  }

  Widget _crearBotones(BuildContext context) {
    return RaisedButton(
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
          child: Container(
            width: 100.0,
            height: 39.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.monetization_on_sharp),
                //Text(control.sumarApuesta().toString()),
                Text(control.sumaTotal.toString() + ".0"),
              ],
            ),
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
        elevation: 0.0,
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'noEnv', arguments: datos);
        });
  }

  void _reset() {
    number = "";
    fijo = "";
    corrido = "";

    selecN = false;
    selecF = false;
    selecC = false;
  }

  bool habilitarBtn() {
    if ((number.length != 0 && fijo.length != 0) ||
        (number.length != 0 && corrido.length != 0)) {
      return true;
    }
    return false;
  }

  void _generarKey() {
    final rnd = new Random();

    final nu1 = rnd.nextInt(99).toString();
    final nu2 = rnd.nextDouble().toString().substring(3, 6);
    final letra1 = letra(rnd.nextInt(13));
    final letra2 = letra(rnd.nextInt(13) - 1);
    final letra3 = letra(rnd.nextInt(13) + 1);
    String codigoFinal = letra1 + nu1 + letra2 + nu2 + letra3;
    if (codigoFinal.length < 8) {
      codigoFinal = codigoFinal + rnd.nextInt(9).toString();
    } else {
      codigoFinal = codigoFinal;
    }
    print("nu1 ${nu1}");
    print("nu2 ${nu2}");
    print("letra1 ${letra1}");
    print("codigo ${codigoFinal}");
    datos.addAll({"key": codigoFinal});
    datos.addAll({"keys": "hola"});

    print("Los parametros en formato map ${datos}");
    print(datos["key"]);
  }

  String letra(int nu1) {
    switch (nu1) {
      case 1:
        return "a";
        break;

      case 2:
        return "c";
        break;

      case 3:
        return "d";
        break;

      case 4:
        return "e";
        break;

      case 1:
        return "b";
        break;

      case 5:
        return "h";
        break;

      case 6:
        return "f";
        break;

      case 7:
        return "r";
        break;

      case 8:
        return "p";
        break;

      case 9:
        return "t";
        break;

      case 10:
        return "z";
        break;

      case 11:
        return "x";
        break;

      case 12:
        return "v";
        break;

      case 13:
        return "w";
        break;

      default:
        return "l";
    }
  }

  void _suma(String fijo, String corrido) {
    int f = int.parse(fijo);
    int c = int.parse(corrido);
    int res = f + c;
    control.sumarApuesta(res);
  }

  /* void _validarReglas() {
    if (int.parse(fijo) > control.limiteFijo.value) {
      mostrarAlerta(context,
          "Verifique las reglas, el fijo esta limitado en esta jornada");
      fijo = "";
    } else {
      fijos.add(fijo);
    }
  } */
}
