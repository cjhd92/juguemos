import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_data.dart';
import 'package:get/get.dart';

class Parle extends StatefulWidget {
  const Parle({super.key});

  static final String routeName = "parle";

  @override
  State<Parle> createState() => _ParleState();
}

String number1 = "";
String number2 = "";
String jugada = "";

bool selecN1 = false;
bool selecN2 = false;
bool selecJ = false;

final control = Get.find<Crontrol>();

class _ParleState extends State<Parle> {
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
        child: Column(
          children: [
            SizedBox(height: 25.0),
            Text(
              "Jugar Parle",
              style: TextStyle(
                  color: Color.fromRGBO(33, 150, 243, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "Baja la posibilidad pero alto el premio",
              style: TextStyle(color: Color.fromRGBO(33, 150, 243, 0.8)),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _texto("Numero 1"),
                SizedBox(width: 15.0),
                _texto("Numero 2"),
                SizedBox(width: 15.0),
                _texto("Apuesta"),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                inputCircularNumber1(),
                SizedBox(width: 12.0),
                inputCircularNumber2(),
                SizedBox(width: 12.0),
                inputCircularJugada(),
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

  Widget inputCircularNumber1() {
    return GestureDetector(
      onTap: () {
        selecN1 = true;
        selecN2 = false;
        selecJ = false;

        setState(() {});
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecN1 == true ? Colors.blue : Colors.white,
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
              Text(number1),
            ],
          )),
    );
  }

  Widget inputCircularNumber2() {
    return GestureDetector(
      onTap: () {
        selecN1 = false;
        selecN2 = true;
        selecJ = false;
        setState(() {});
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecN2 == true ? Colors.blue : Colors.white,
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
              Text(number2),
            ],
          )),
    );
  }

  Widget inputCircularJugada() {
    return GestureDetector(
      onTap: () {
        selecN1 = false;
        selecN2 = false;
        selecJ = true;
        setState(() {});
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: selecJ == true ? Colors.blue : Colors.white,
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
              Text(jugada),
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
            onPressed: habilitarBtn()
                ? () {
                    setState(() {
                      control.setParle(number1, number2, jugada);
                      _reset();
                    });
                  }
                : null)
      ],
    );
  }

  void _selecBtn(String btn) {
    if (selecN1 && number1.length < 2) {
      number1 = number1 + btn;
    } else {
      print("numero supera mas de dos digitos $number1");
    }
    if (selecN2 && number2.length < 2) {
      number2 = number2 + btn;
    } else {
      print(" fijo supera mas de dos digitos $number2");
    }

    if (selecJ && jugada.length < 5) {
      jugada = jugada + btn;
    } else {
      print(" corrido supera mas de dos digitos $jugada");
    }
  }

  void _borrar() {
    if (selecN1) {
      if (number1.length > 0) {
        number1 = number1.substring(0, number1.length - 1);
      } else {
        number1 = "";
      }
    }

    if (selecN2) {
      if (number2.length > 0) {
        number2 = number2.substring(0, number2.length - 1);
      } else {
        number2 = "";
      }
    }

    if (selecJ) {
      if (jugada.length > 0) {
        jugada = jugada.substring(0, jugada.length - 1);
      } else {
        jugada = "";
      }
    }
  }

  bool habilitarBtn() {
    if (number1.length != 0 && number2.length != 0 && jugada.length != 0) {
      return true;
    }
    return false;
  }

  void _reset() {
    number1 = "";
    number2 = "";
    jugada = "";

    selecN1 = false;
    selecN2 = false;
    selecJ = false;
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
                Text('8500.00'),
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
          Navigator.pushReplacementNamed(context, 'noEnv');
        });
  }
}
