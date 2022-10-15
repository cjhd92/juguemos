import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_data.dart';
import 'package:get/get.dart';

class Centena extends StatefulWidget {
  const Centena({super.key});

  static final String routeName = "centena";

  @override
  State<Centena> createState() => _CentenaState();
}

class _CentenaState extends State<Centena> {
  String centena = "";
  String apuesta = "";

  bool selecC = false;
  bool selecA = false;
  final control = Get.find<Crontrol>();

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
            Obx((() => Text(" ListDigital  ${control.userName}"))),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(

            /// mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Jugar Centena",
                style: TextStyle(
                    color: Color.fromRGBO(33, 150, 243, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                "El Pick3 (Ejemplo 726)",
                style: TextStyle(color: Color.fromRGBO(33, 150, 243, 0.8)),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _texto("Centena"),
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
            ]),
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
        selecC = true;
        selecA = false;

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
              Text(centena),
            ],
          )),
    );
  }

  Widget inputCircularNumber2() {
    return GestureDetector(
      onTap: () {
        selecC = false;
        selecA = true;

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
    if (selecC && centena.length < 3) {
      centena = centena + btn;
    } else {
      print("numero supera mas de dos digitos $centena");
    }
    if (selecA && apuesta.length < 2) {
      apuesta = apuesta + btn;
    } else {
      print(" fijo supera mas de dos digitos $apuesta");
    }

    /*  if (selecJ && jugada.length < 5) {
      jugada = jugada + btn;
    } else {
      print(" corrido supera mas de dos digitos $jugada");
    } */
  }

  void _borrar() {
    if (selecC) {
      if (centena.length > 0) {
        centena = centena.substring(0, centena.length - 1);
      } else {
        centena = "";
      }
    }

    if (selecA) {
      if (apuesta.length > 0) {
        apuesta = apuesta.substring(0, apuesta.length - 1);
      } else {
        apuesta = "";
      }
    }

    /*    if (selecJ) {
      if (jugada.length > 0) {
        jugada = jugada.substring(0, jugada.length - 1);
      } else {
        jugada = "";
      }
    } */
  }

  bool habilitarBtn() {
    if (centena.length != 0 && apuesta.length != 0) {
      return true;
    }
    return false;
  }

  void _reset() {
    centena = "";
    apuesta = "";

    selecC = false;
    selecA = false;
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
