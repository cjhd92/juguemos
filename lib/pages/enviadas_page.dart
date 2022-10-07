//import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';

class Enviadas extends StatefulWidget {
  const Enviadas({super.key});

  static final String routeName = "enviadas";

  @override
  State<Enviadas> createState() => _EnviadasState();
}

class _EnviadasState extends State<Enviadas> {
  String _fecha = "";
  String _dia = new DateTime.now().toString().substring(0, 10).substring(8, 10);
  String _mes = new DateTime.now().toString().substring(0, 10).substring(5, 7);

  List<String> _jornada = ["Dia", "noche"];

  var items = ["Dia", "Noche"];
  String valorSel = 'Diaz';

  TextEditingController _controlCalendario = new TextEditingController();

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                //print(_screenSize.height);
                Navigator.pushReplacementNamed(context, "home");
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
          // color: Colors.pink,
          height: _screenSize.height,
          child: Column(
            children: <Widget>[
              _firma(_screenSize),
              _lista(_screenSize),
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
          Navigator.pushReplacementNamed(context, 'home');
        });
  }

  Widget _firma(_screenSize) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      //color: Colors.green,
      width: double.infinity,
      height: _screenSize.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 18.0),
          Text(
            "Firma: 123456789",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 19.0),
          Text("Buscar jugadas enviadas",
              style: TextStyle(color: Colors.blue, fontSize: 20)),
          SizedBox(height: 20),
          /*  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Buscar por fecha"),
              _calendario(),
            ],
          ),
          SizedBox(height: 20), */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Buscar por jornada"),
              Container(
                width: 120,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue,
                    border: Border.all()),
                child: DropdownButton(
                    value: _value,
                    items: [
                      DropdownMenuItem(child: Text("Dia"), value: 1),
                      DropdownMenuItem(child: Text("Noche"), value: 2)
                    ],
                    onChanged: (int? value) {
                      setState(() {});
                      _value = value!;
                      print(_value);
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _lista(_screenSize) {
    return Container(
      //color: Colors.amber,
      width: double.infinity,
      height: _screenSize.height * 0.6,
      child: ListView(children: <Widget>[
        _jugadasSimpel(),
        _jugadasCompuesta(),
        _jugadasSimpel(),
        _jugadasSimpel(),
        _jugadasCompuesta(),
        _jugadasSimpel(),
        _jugadasSimpel(),
        _jugadasCompuesta(),
        _jugadasSimpel(),
        _jugadasSimpel(),
        _jugadasCompuesta(),
        _jugadasSimpel(),
      ]),
    );
  }

  Widget _jugadasSimpel() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Text(
            "22",
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
                Text("5000"),
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
                Text("5000"),
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

  Widget _calendario() {
    return RaisedButton(
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
          child: Container(
            width: 100.0,
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.calendar_month_outlined, size: 20.0),
                Text(_dia + ' / ' + _mes),
              ],
            ),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 0.0,
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          _selecDate(context);
        });
  }

  _selecDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2023),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _fecha = _fecha.substring(0, 10);
        _dia = _fecha.substring(8, 10);
        _mes = _fecha.substring(5, 7);
        _mes = _mesLetra(_mes);
        _controlCalendario.text = _mes;
      });
    }
  }

  String _mesLetra(String mes) {
    switch (mes) {
      case "01":
        return "Ene";
        break;
      case "02":
        return "Feb";
        break;
      case "03":
        return "Mar";
        break;
      case "04":
        return "Abr";
        break;
      case "05":
        return "May";
        break;
      case "06":
        return "Jun";
        break;
      case "07":
        return "Jul";
        break;
      case "08":
        return "Agot";
        break;
      case "09":
        return "Sept";
        break;
      case "10":
        return "Oct";
        break;
      case "11":
        return "Nov";
        break;
      case "12":
        return "Dic";
        break;

      default:
        return "";
    }
  }

/*   List<DropdownMenuItem<String>> getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = new List();

    _jornada.forEach((j) {
      lista.add(DropdownMenuItem(
        child: Text(j),
        value: j,
      ));
    });

    return lista;
  } */

  /*  Widget _crearDropdown() {
    
    DropdownButton<String>(
      /*    items: getOpcionesDropDown(),
        onChanged: (opt) {
          print(opt);
        } */
      value: valorSel,
      items: <String>['p', 'g'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          valorSel = newValue!;
        });
      },
    );
  } */
}
