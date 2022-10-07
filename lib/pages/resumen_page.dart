import 'package:flutter/material.dart';

class Resumen extends StatelessWidget {
  const Resumen({super.key});

  static final String routeName = "resumen";

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
        child: Text("resumen"),
      ),
    );
  }
}
