//import 'dart:html';
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/get_rule_provider.dart';
import 'package:flutter_application_1/provider/provider_data.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
/*   const HomePage({super.key}); */

  static final String routeName = "home";

  final control = Get.find<Crontrol>();

  final rulesProvider = new RulesProvider();

  @override
  Widget build(BuildContext context) {
    rulesProvider.rules();
    rulesProvider.rulesSesion();
    rulesProvider.listOpen();

    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx((() => Text(" ListDigital  ${control.userName}"))),
              IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                ),
                onPressed: () {
                  _mostrarAlert(context);
                },
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: ListView(
            children: [
              Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Montar Lista",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Color.fromARGB(
                                255,
                                33,
                                150,
                                235,
                              )),
                        ),
                      ],
                    ),
                    _option("Bolas", "El Fijo por 75 cup.Corrido por 25cup",
                        Icon(Icons.lens_blur_outlined), context, "bola"),
                    _lineaDividir(),
                    _option("Parle", "El Parle se paga 1000 por peso",
                        Icon(Icons.control_point_sharp), context, "parle"),
                    _lineaDividir(),
                    _option("Candado", "Jugar en Candado",
                        Icon(Icons.lock_open), context, "candado"),
                    _lineaDividir(),
                    _option("Centena", "Se paga a 400 por peso",
                        Icon(Icons.hdr_weak_rounded), context, "centena"),
                    _lineaDividir(),
                    _option("Terminal", "Jugar toods los terminales",
                        Icon(Icons.password_sharp), context, "terminal"),
                    _lineaDividir(),
                    _option("Decenas", "Jugar toods las decenas",
                        Icon(Icons.device_hub_rounded), context, "decena"),
                    _lineaDividir(),
                    _option(
                        "Multiple",
                        "Jugar multiple",
                        Icon(Icons.multiple_stop_outlined),
                        context,
                        "multiple"),
                    SizedBox(height: 15.0),
                  ],
                ),
              ),
              Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mis Listas",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Color.fromARGB(
                                255,
                                33,
                                150,
                                235,
                              )),
                        ),
                      ],
                    ),
                    _option("Resumen", "Limpio, Premio, Pierde y Gana",
                        Icon(Icons.restore_page_rounded), context, "resumen"),
                    _lineaDividir(),
                    _option("Enviadas", "Buscar lista  enviadas",
                        Icon(Icons.send), context, "enviadas"),
                    _lineaDividir(),
                    _option("Sin Enviar", "Tu lista de hoy",
                        Icon(Icons.segment_rounded), context, "noEnv"),
                    _lineaDividir(),
                    _option(
                        "Almacenamiento",
                        "Lista y vales guardados en el telefono",
                        Icon(Icons.storage_rounded),
                        context,
                        "almacenamiento"),
                    SizedBox(height: 15.0),
                  ],
                ),
              ),
              Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Limitados",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Color.fromARGB(
                                255,
                                33,
                                150,
                                235,
                              )),
                        ),
                      ],
                    ),
                    _option(
                        "Bola",
                        "Limita la bola del dia y la noche",
                        Icon(Icons.label_important_outline_sharp),
                        context,
                        "limitarB"),
                    _lineaDividir(),
                    _option(
                        "Parle",
                        "Limita la parle del dia y la noche",
                        Icon(Icons.label_important_outlined),
                        context,
                        "limitarP"),
                    SizedBox(height: 15.0),
                  ],
                ),
              ),
              Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Usuario",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Color.fromARGB(
                                255,
                                33,
                                150,
                                235,
                              )),
                        ),
                      ],
                    ),
                    _option("Cambia tu clave", "Edita la clave del trabajador",
                        Icon(Icons.key, size: 30), context, "usuario"),
                    SizedBox(height: 15.0),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _option(String titulo, String subtitulo, Icon icono,
      BuildContext contex, String ruta) {
    return ListTile(
      iconColor: Colors.blue,
      leading: icono,
      title: Text(titulo),
      subtitle: Text(subtitulo),
      trailing: IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(contex, ruta);
        },
        icon: Icon(
          Icons.play_arrow,
          size: 20,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _lineaDividir() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        color: Color.fromARGB(255, 33, 150, 235),
        height: 2,
      ),
    );
  }

  _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text(
              "Salir de ListDigital",
              style: TextStyle(color: Colors.blue),
            ),
            content: Text(
              "Desea salir de la App ?",
              style: TextStyle(
                  color: Color.fromRGBO(33, 150, 243, 0.8),
                  fontWeight: FontWeight.w500),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar'),
                textColor: Color.fromRGBO(63, 63, 156, 0.8),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/");
                },
                child: Text('Aceptar'),
                textColor: Color.fromRGBO(90, 70, 178, 1.0),
              ),
            ],
          );
        });
  }
}
