import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_data.dart';
import 'package:get/get.dart';

class CambiarUser extends StatefulWidget {
  const CambiarUser({super.key});

  static final String routeName = "usuario";

  @override
  State<CambiarUser> createState() => _CambiarUserState();
}

final fieldPassActual = TextEditingController();
final fieldPass = TextEditingController();
final fieldPassConfirmada = TextEditingController();

final control = Get.find<Crontrol>();

String passActual = "";
String passNew = "";
String passNewConfirmada = "";

bool erroPass = true;
bool erroPassActual = true;
bool erroPassConfirmada = true;

class _CambiarUserState extends State<CambiarUser> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                passNew = "";
                passNewConfirmada = "";
                fieldPass.clear();
                fieldPassConfirmada.clear();
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
      body: Center(
        child: Container(
          width: 400,
          height: size.height * 0.65,
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Modifica tu contraseña",
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
                    SizedBox(height: 10),
                    _crearPassActual(),
                    SizedBox(height: 10),
                    _crearEmail(),
                    SizedBox(height: 15),
                    _crearPass(),
                    SizedBox(height: 25),
                    _crearBoton()
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget _crearPassActual() {
    return TextField(
      controller: fieldPassActual,
      onChanged: (value) {
        setState(() {
          passActual = value;
          // erroPass = _verificarPassNew();
          //erroPassConfirmada = _verificarPassConfirmada();
          erroPassActual = _verificarPassActual(passActual);
          print(erroPassActual);
        });
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Contraseña actual',
          labelText: 'Contraseña actual',
          suffixIcon: Icon(Icons.location_history_outlined),
          icon: Icon(Icons.perm_identity_outlined),
          errorText:
              erroPassActual ? null : "Debe colocar la contraseña actual"),
    );
  }

  Widget _crearEmail() {
    return TextField(
      controller: fieldPass,
      onChanged: (value) {
        setState(() {
          passNew = value;
          erroPass = _verificarPassNew();
          erroPassConfirmada = _verificarPassConfirmada();
        });
      },
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Contraseña nueva',
          labelText: 'Contraseña nueva',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
          errorText: erroPass ? null : "Debe tener minimo 6 caracteres"),
    );
  }

  Widget _crearPass() {
    return TextField(
        controller: fieldPassConfirmada,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Contraseña de confrimacion',
            labelText: 'Contraseña de confrimacion',
            suffixIcon: Icon(Icons.lock),
            icon: Icon(Icons.password),
            errorText: erroPassConfirmada
                ? null
                : "Ambas contraseñas deben ser iguales"),
        onChanged: (valor) {
          setState(() {
            passNewConfirmada = valor;
            erroPassConfirmada = _verificarPassConfirmada();
          });
        });
  }

  Widget _crearBoton() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text(
                'Ingresar cambios',
                style: TextStyle(fontSize: 15),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 0.0,
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: _habitarBtn()
                ? () {
                    setState(() {
                      _sendData();
                    });
                  }
                : null);
      },
    );
  }

  bool _verificarPassNew() {
    if (passNew.length >= 6) {
      return true;
    }

    return false;
  }

  bool _verificarPassConfirmada() {
    if (passNewConfirmada.trim() == passNew.trim()) {
      return true;
    }

    return false;
  }

  bool _habitarBtn() {
    if (erroPass == true &&
        passNew.length > 0 &&
        erroPassConfirmada == true &&
        passNewConfirmada.length > 0 &&
        control.userPass == passActual) {
      return true;
    }

    return false;
  }

  void _sendData() {
    passNew = "";
    passNewConfirmada = "";
    fieldPass.clear();
    fieldPassConfirmada.clear();
  }

  bool _verificarPassActual(String passActual) {
    var temp = control.userPass;
    /* print(control.userPass);
    print(temp); */
    if (passActual == temp.toString()) {
      return true;
      //print("si");
    }

    return false;
  }
}
