import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_data.dart';
import 'package:get/get.dart';

class NoEnv extends StatefulWidget {
  const NoEnv({super.key});

  static final String routeName = "noEnv";

  @override
  State<NoEnv> createState() => _NoEnvState();
}

class _NoEnvState extends State<NoEnv> {
  String firma_jugadas = "";
  String number = "";
  String fijo = "";
  String corrido = "";

  final control = Get.find<Crontrol>();

  Widget build(BuildContext context) {
    dynamic parametros = ModalRoute.of(context)?.settings.arguments;

    //cargar_datos();

    //print("Los parametros en formato map ${parametros}");
    //print(parametros["key"]);
    firma_jugadas = parametros["key"];
    //print(parametros["key"]);
    //final k = parametros['key'];

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
            Expanded(child: SizedBox()),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.share_rounded),
                color: Colors.white),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.open_in_new_rounded),
                color: Colors.white),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete_outline_outlined),
                color: Colors.white70),
          ],
        ),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          _firma(context),
          _lista(context),
        ],
      )),
      floatingActionButton: _crearBotones(context),
    );
  }

  Widget _crearBotones(BuildContext context) {
    return RaisedButton(
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
          child: Container(
            width: 70.0,
            height: 39.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                ),
                Text('Atras'),
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
          Navigator.pushReplacementNamed(context, 'bola');
        });
  }

  Widget _firma(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 18.0),
          Text(
            "Firma: " + firma_jugadas,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 19.0),
          Text("Jugadas de Hoy",
              style: TextStyle(color: Colors.blue, fontSize: 20)),
        ],
      ),
    );
  }

  Widget _lista(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
        //color: Colors.amber,
        width: double.infinity,
        height: _screenSize.height * 0.76,
        child: ListView.builder(
          itemCount: control.listaSinConexion.length,
          itemBuilder: (BuildContext context, int index) {
            return _jugadas(index);
          },
        ));
  }

  Widget _jugadasSimpel(String n, String f, String c) {
    if (n.length == 1) {
      n = "0" + n;
    } else
      n = n;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Text(
            n,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(width: 8.0),
          Text("-",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          SizedBox(width: 8.0),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(f),
              ],
            ),
          ),
          SizedBox(width: 8.0),
          Text("-",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          SizedBox(width: 8.0),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(c),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _jugadasCompuesta() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Column(
            children: [
              Text(
                "22",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Text(
                "55",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ],
          ),
          SizedBox(width: 28.0),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("5000"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  cargar_datos() {
    int ver = control.listaSinConexion.length;
    List<List<String>> valor = [];
    var tipoJugada;
    var datos = control.listaSinConexion;
    print("datos ${datos}");
    //Obx(() => print("f"));
    /*  print("size ${ver}");
    print("datos ${datos["1"]}"); */

    for (var i = 1; i <= ver; i++) {
      /* print(datos[i.toString()]); */
      tipoJugada = datos[i.toString()];
      print(tipoJugada);

      //valor.add(["1", "d", "u"]);
      /*  switch (tipoJugada[0]) {
        case "s":
          print("Caso 1");
        
          number = tipoJugada[1];
          fijo = tipoJugada[2];
          corrido = tipoJugada[3];
          
          return Text("caso1");
        
          break;

        case "c":
          print("Caso 2");
          print(datos[i.toString()]);
          return Text("caso2");

          break;
        default:
          return Text("caso3");
       
      } */
    }

    // print(ll[0]);
  }

  Widget _jugadas(int index) {
    index++;
    List<List<String>> valor = [];
    var tipoJugada;
    var datos = control.listaSinConexion;
    tipoJugada = datos[index.toString()];
    print("jugadas  ${tipoJugada[0]}");

    if (index % 2 == 0) {
      return Container(
          width: double.infinity,
          height: 80,
          color: Color.fromRGBO(33, 150, 243, 0.1),
          child: _selectJugada(tipoJugada));
    } else {
      return Container(
          width: double.infinity,
          height: 80,
          color: Colors.white,
          child: _selectJugada(tipoJugada));
    }
  }

  Widget _selectJugada(tipoJugada) {
    if (tipoJugada[0] == "s") {
      number = tipoJugada[1];
      fijo = tipoJugada[2];
      corrido = tipoJugada[3];

      return _jugadasSimpel(number, fijo, corrido);
      //return Text("s");
    } else {
      number = tipoJugada[1];
      fijo = tipoJugada[2];
      corrido = tipoJugada[3];

      return Text("Parle");
    }
  }
}
