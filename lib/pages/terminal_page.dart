import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_data.dart';
import 'package:get/get.dart';

class Terminal extends StatefulWidget {
  const Terminal({super.key});

  static final String routeName = "terminal";

  @override
  State<Terminal> createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  String terminal = "";
  String fijo = "";
  String corrido = "";

  bool selecT = false;
  bool selecF = false;
  bool selecC = false;

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
        child: Column(

            /// mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Jugar Terminal",
                style: TextStyle(
                    color: Color.fromRGBO(33, 150, 243, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                " (Ejemplo: Terminal 2 es 02,12,22,32,...,92)",
                style: TextStyle(color: Color.fromRGBO(33, 150, 243, 0.8)),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _texto("Terminal"),
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
                  inputCircularTerminal(),
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

  Widget inputCircularTerminal() {
    return GestureDetector(
      onTap: () {
        selecT = true;
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
                color: selecT == true ? Colors.blue : Colors.white,
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
              Text(terminal),
            ],
          )),
    );
  }

  Widget inputCircularFijo() {
    return GestureDetector(
      onTap: () {
        selecT = false;
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
        selecT = false;
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
    if (selecT && terminal.length < 2) {
      terminal = terminal + btn;
    } else {
      print("numero supera mas de dos digitos $terminal");
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
                      _reset();
                    });
                  }
                : null)
      ],
    );
  }

  void _borrar() {
    if (selecT) {
      if (terminal.length > 0) {
        terminal = terminal.substring(0, terminal.length - 1);
      } else {
        terminal = "";
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

  void _reset() {
    terminal = "";
    fijo = "";
    corrido = "";

    selecT = false;
    selecF = false;
    selecC = false;
  }

  bool habilitarBtn() {
    if ((terminal.length != 0 && fijo.length != 0) ||
        (terminal.length != 0 && corrido.length != 0)) {
      return true;
    }
    return false;
  }
}
