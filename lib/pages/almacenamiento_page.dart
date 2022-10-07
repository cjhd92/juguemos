import 'package:flutter/material.dart';

class Almacenamiento extends StatelessWidget {
  const Almacenamiento({super.key});

  static final String routeName = "almacenamiento";

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
        child: Text("almacenamiento"),
      ),
    );
  }
}
