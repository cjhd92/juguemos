import 'package:flutter/material.dart';

class Resumen extends StatefulWidget {
  const Resumen({super.key});

  static final String routeName = "resumen";

  @override
  State<Resumen> createState() => _ResumenState();
}

bool mesInicial = false;
String _fecha = "";
String _dia = new DateTime.now().toString().substring(0, 10).substring(8, 10);
String _mes = new DateTime.now().toString().substring(0, 10).substring(5, 7);
TextEditingController _controlCalendario = new TextEditingController();

//List<String> _jornada = ["Dia", "noche"];

var items = ["Dia", "Noche"];
String valorSel = 'Diaz';
int _value = 1;

class _ResumenState extends State<Resumen> {
  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(
              "Resumen",
              style: TextStyle(
                  color: Color.fromRGBO(33, 150, 243, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              "Limpio,Premio,Pierde y Gana",
              style: TextStyle(color: Color.fromRGBO(33, 150, 243, 0.8)),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Buscar por fecha"),
                /*  ElevatedButton(
                    onPressed: () {
                      // _calendario();
                    },
                    child: _calendario()) */
                _calendario()
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Buscar por jornada"),
                Container(
                  // width: 101,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color.fromRGBO(33, 150, 243, 1),
                    //border: Border.all()
                  ),
                  child: DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                            child: Text(
                              "Dia",
                            ),
                            value: 1),
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
      ),
    );
  }

  Widget _calendario() {
    return RaisedButton(
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
          child: Container(
            width: 80.0,
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.calendar_month_outlined, size: 20.0),
                mesInicial
                    ? Text(_dia + ' / ' + _mes)
                    : Text(_dia + ' / ' + _mesLetra(_mes))
              ],
            ),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 0.0,
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          mesInicial == true;
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
        //_mes = _mesLetra(_mes);
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
}
