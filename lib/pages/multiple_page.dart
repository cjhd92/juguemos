import 'package:flutter/material.dart';

class Multiple extends StatefulWidget {
  //const Multiple({super.key});

  static final String routeName = "multiple";

  @override
  State<Multiple> createState() => _MultipleState();
}

String numero = "";
String fijo = "";
String corrido = "";
String candado = "";
String btn = "";
int item = 0;

/* bool selecN = false;
bool selecF = false;
bool selecC = false; */
//List<bool> selecCandado = List<bool>.filled(20, false);
List<String> number = List<String>.filled(20, "");
List<bool> selecNumber = List<bool>.filled(20, false);

List<String> fijos = List<String>.filled(20, "");
List<bool> selecFijo = List<bool>.filled(20, false);

List<String> corridos = List<String>.filled(20, "");
List<bool> selecCorrido = List<bool>.filled(20, false);

List<String> numberTemp = [];

bool selecCandado = false;

class _MultipleState extends State<Multiple> {
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
            Text(" ListDigital "),
          ],
        ),
      ),
      body: Container(
          //color: Colors.black12,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Jugar Multiple",
                style: TextStyle(
                    color: Color.fromRGBO(33, 150, 243, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _texto("Numero"),
                  SizedBox(width: 15.0),
                  _texto("Fijo"),
                  SizedBox(width: 15.0),
                  _texto("Corrido"),
                  SizedBox(width: 45.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      // color: Colors.white,
                      height: size.height * 0.35,
                      width: size.width * 0.7,
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              inputCircularNumber(index),
                              SizedBox(width: 10),
                              inputCircularFijo(index),
                              SizedBox(width: 10),
                              inputCircularCorrido(index),
                            ],
                          );
                        },
                      )),
                  Column(
                    children: [
                      _texto("Candado"),
                      inputCircularCandado(),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              _teclado()
            ],
          )),
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

  Widget inputCircularNumber(int index) {
    return GestureDetector(
      onTap: () {
        selecNumber = selecNumber.map<bool>((v) => false).toList();
        selecFijo = selecFijo.map<bool>((v) => false).toList();
        selecCorrido = selecCorrido.map<bool>((v) => false).toList();
        selecCandado = false;
        selecNumber[index] = true;
        item = index;

        setState(() {});
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 5),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecNumber[index] ? Colors.blue : Colors.white,
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
              Text(number[index]),
            ],
          )),
    );
  }

  Widget inputCircularFijo(int index) {
    return GestureDetector(
      onTap: () {
        selecNumber = selecNumber.map<bool>((v) => false).toList();
        selecFijo = selecFijo.map<bool>((v) => false).toList();
        selecCorrido = selecCorrido.map<bool>((v) => false).toList();
        selecCandado = false;
        selecFijo[index] = true;
        item = index;

        setState(() {});
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 5),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecFijo[index] ? Colors.blue : Colors.white,
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
              Text(fijos[index]),
            ],
          )),
    );
  }

  Widget inputCircularCorrido(int index) {
    return GestureDetector(
      onTap: () {
        selecNumber = selecNumber.map<bool>((v) => false).toList();
        selecFijo = selecFijo.map<bool>((v) => false).toList();
        selecCorrido = selecCorrido.map<bool>((v) => false).toList();
        selecCandado = false;
        selecCorrido[index] = true;
        item = index;
        setState(() {});
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 5),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecCorrido[index] ? Colors.blue : Colors.white,
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
              Text(corridos[index]),
            ],
          )),
    );
  }

  Widget inputCircularCandado() {
    return GestureDetector(
      onTap: () {
        selecNumber = selecNumber.map<bool>((v) => false).toList();
        selecFijo = selecFijo.map<bool>((v) => false).toList();
        selecCorrido = selecCorrido.map<bool>((v) => false).toList();
        selecCandado = true;

        setState(() {});
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecCandado == true ? Colors.blue : Colors.white,
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
              Text(candado),
            ],
          )),
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
            onPressed: true
                ? () {
                    setState(() {
                      print(number);

                      for (int i = 0; i < 20; i++) {
                        if (number[i] != "") {
                          numberTemp.add(number[i]);
                        }
                      }

                      print(numberTemp);

                      /*  number.removeRange(1, 4);
                      print(number); */

                      //_validarReglas();
                      // _generarKey();
                      //jugada.add("s");
                      //numeros.add(number);

                      /*   print("numero añadido ${number}");
                      print("fijo añadido ${fijo}");
                      print("corrrido añadido ${corrido}"); */
                      //control.id_pk.value++;

                      /*  control.setIdemPks(control.id_pk.value);

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
 */
                      /* fijos.add(fijo);
                      corridos.add(corrido); */

                      //control.getJugada(number);
                      /* control.getJugada(fijos);
                      control.getJugada(corridos); */
                      //_reset();
                    });
                  }
                : null)
      ],
    );
  }

  _selecBtn(String s) {
    if (selecNumber[item]) {
      btn = s;

      if (number[item].length < 2) {
        number[item] = number[item] + btn;
      }
    }

    if (selecFijo[item]) {
      btn = s;
      if (fijos[item].length < 5) {
        fijos[item] = fijos[item] + btn;
      }
    }

    if (selecCorrido[item]) {
      btn = s;
      if (corridos[item].length < 5) {
        corridos[item] = corridos[item] + btn;
      }
    }

    if (selecCandado) {
      btn = s;
      if (candado.length < 5) {
        candado = candado + btn;
      }
    }
  }

  void _borrar() {
    if (selecNumber[item]) {
      if (number[item].length > 0) {
        // number[item] = number[item];
        number[item] = number[item].substring(0, number[item].length - 1);
      } else {
        number[item] = "";
      }
    }

    if (selecFijo[item]) {
      if (fijos[item].length > 0) {
        // number[item] = number[item];
        fijos[item] = fijos[item].substring(0, fijos[item].length - 1);
      } else {
        fijos[item] = "";
      }
    }

    if (selecCorrido[item]) {
      if (corridos[item].length > 0) {
        // number[item] = number[item];
        corridos[item] = corridos[item].substring(0, corridos[item].length - 1);
      } else {
        corridos[item] = "";
      }
    }

    if (selecCandado) {
      if (candado.length > 0) {
        // number[item] = number[item];
        candado = candado.substring(0, candado.length - 1);
      } else {
        candado = "";
      }
    }
  }

  bool _habilitarBtn() {
    print("total");
    print(number[item].length - 20 + item);
    print("resta");
    print(number);

    if ((number[item].length != 0 && fijos[item].length != 0) ||
        (number[item].length != 0 && corridos[item].length != 0)) {
      print("tr");
      return true;
    } else {
      print("fal");
      return false;
    }
  }
}
//      || (number[item].length == 0 && corridos[item].length == 0)