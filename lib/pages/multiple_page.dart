import 'package:flutter/material.dart';

class Multiple extends StatefulWidget {
  //const Multiple({super.key});

  static final String routeName = "multiple";

  String data = "";
  String fijo = "";
  String corrido = "";

  bool selecN = false;
  bool selecF = false;
  bool selecC = false;

  @override
  State<Multiple> createState() => _MultipleState();
}

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
          child: Column(
        children: [Text("multiple")],
      )),
    );
  }
}
