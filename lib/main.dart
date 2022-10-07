import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/almacenamiento_page.dart';
import 'package:flutter_application_1/pages/bola_page.dart';
import 'package:flutter_application_1/pages/cambiar_user_page.dart';
import 'package:flutter_application_1/pages/candado_page.dart';
import 'package:flutter_application_1/pages/centena_page.dart';
import 'package:flutter_application_1/pages/decena_page.dart';
import 'package:flutter_application_1/pages/enviadas_page.dart';

import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/limitarB_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/multiple_page.dart';
import 'package:flutter_application_1/pages/noEnv_page.dart';
import 'package:flutter_application_1/pages/parle_page.dart';
import 'package:flutter_application_1/pages/resumen_page.dart';
import 'package:flutter_application_1/pages/terminal_page.dart';

/* void main() {
  runApp(const MyApp()); */
/*   runApp(
    Multiprovider(
      providers:[
        ChangeNotifierProvider(create: (_) => ProviderData()),
        child: const MyApp()
      ]
    )
  ); */
//}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
/*     var child = ListView.builder(
      itemBuilder: (_, index) => const Center(),
      itemCount: 4,
    ); */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) => LoginPage(),
        "home": (BuildContext context) => HomePage(),
        "bola": (BuildContext context) => Bola(),
        "parle": (BuildContext context) => Parle(),
        "candado": (BuildContext context) => Candado(),
        "centena": (BuildContext context) => Centena(),
        "terminal": (BuildContext context) => Terminal(),
        "decena": (BuildContext context) => Decena(),
        "multiple": (BuildContext context) => Multiple(),
        "resumen": (BuildContext context) => Resumen(),
        "enviadas": (BuildContext context) => Enviadas(),
        "noEnv": (BuildContext context) => NoEnv(),
        "almacenamiento": (BuildContext context) => Almacenamiento(),
        "limitarB": (BuildContext context) => LimitarB(),
        "usuario": (BuildContext context) => CambiarUser(),
      },
      /*   theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)), */
    );
  }
}
