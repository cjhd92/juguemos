import 'package:flutter/material.dart';

class Multiple extends StatefulWidget {
  //const Multiple({super.key});

  static final String routeName = "multiple";

  @override
  State<Multiple> createState() => _MultipleState();
}

String data = "";
String fijo = "";
String corrido = "";

bool selecN = false;
bool selecF = false;
bool selecC = false;
List<bool> selecCandado = List<bool>.filled(20, false);

class _MultipleState extends State<Multiple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/");
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
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
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
              Container(
                  color: Colors.black12,
                  height: 400,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 40,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: <Widget>[
                          inputCircularNumber(index),
                          SizedBox(width: 20),
                          Text("Fijo"),
                          SizedBox(width: 20),
                          Text("corrido"),
                        ],
                      );
                    },
                  )),
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
        selecN = true;
        selecF = false;
        selecC = false;

        setState(() {});
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 10),
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
              Text("1"),
            ],
          )),
    );
  }
}
