import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/provider_data.dart';
import 'package:flutter_application_1/provider/usuario_provider.dart';
import 'package:flutter_application_1/util/util.dart';
import 'package:get/get.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String pass = "";
String user = "";

String userEdit = "";
String passEdit = "";
String passNew = "";
String passConfirmarda = "";
bool click = true;

bool errPass = true;
bool errPassedit = true;

final usuarioProvider = new UsuarioProvider();

final control = Get.put(Crontrol());

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //print(httpsUri); // https://example.com/page/?

    return Scaffold(
        body: Stack(
      children: <Widget>[
        _crearFondo(context),
        _loginForm(context),
        CircularProgressIndicator(),
      ],
    )
        /*    body: FutureBuilder(
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Stack(
            
            children: <Widget>[
              _crearFondo(context),
              _loginForm(context),
            ],
          );
        }
      }),
    ) */
        );
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoAzul = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: <Color>[Colors.blue, Colors.blueAccent])),
    );

    final circulos = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(225, 255, 255, 0.1)),
    );

    return Stack(
      children: <Widget>[
        fondoAzul,
        Positioned(
          top: 90,
          left: 30,
          child: circulos,
        ),
        Positioned(
          top: -40,
          right: -30,
          child: circulos,
        ),
        Positioned(
          bottom: -50,
          right: -10,
          child: circulos,
        ),
        Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text("Bienvenido a ListDiditalT",
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          ),
        )
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        SafeArea(
            child: Container(
          height: 225.0,
        )),
        Container(
          width: size.width * 0.85,
          padding: EdgeInsets.symmetric(vertical: 50.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0)
              ]),
          child: Column(
            children: <Widget>[
              Text(
                "Ingresos",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              SizedBox(
                height: 50.0,
              ),
              _userBox(),
              SizedBox(
                height: 30.0,
              ),
              _passBox(),
              SizedBox(
                height: 30.0,
              ),
              _crearBoton()
            ],
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => _mostrarAlert(context),
              child: Text(
                "Modificar la contraseña",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            Text("Entrar sin conexion",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ],
        ),
      ]),
    );
  }

  Widget _userBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.alternate_email,
            color: Colors.blue,
          ),
          hintText: "Escriba su nombre de usuario",
          labelText: "Usuario",
        ),
        onChanged: (valor) {
          user = valor;

          setState(() {});
        },
      ),
    );
  }

  Widget _passBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock_outlined,
              color: Colors.blue,
            ),
            errorText:
                errPass ? null : "La contraseña debe ser más de 5 caracteres",
            hintText: "Escriba su contraseña",
            labelText: "Contraseña"),
        onChanged: (valor) {
          pass = valor;
          errPass = _verificaErrorPass();

          setState(() {});
        },
      ),
    );
  }

  Widget _crearBoton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text("Ingresar", style: TextStyle(color: Colors.white)),
      ),
      onPressed: _habilitarBtn()
          ? () {
              control.getUser(user);
              control.getPass(pass);
              _verificarUser(user, pass);

              //Navigator.pushReplacementNamed(context, "home");
              //pass = "";
              //user = "";
              /*  print(user);
              print(pass); */
              //usuarioProvider.login(user, pass);
            }
          : null,
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
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
              "Modifique su contraseña",
              style: TextStyle(color: Colors.blue),
            ),
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              _editarUser(),
              SizedBox(height: 12.0),
              _editarPassword(),
              SizedBox(height: 12.0),
              _passwordActual(),
              SizedBox(height: 12.0),
              _confirmarPassword(),
            ]),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancelar'),
                textColor: Color.fromRGBO(63, 63, 156, 0.8),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Aceptar'),
                textColor: Color.fromRGBO(90, 70, 178, 1.0),
              ),
            ],
          );
        });
  }

  Widget _editarUser() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(
              Icons.person_pin,
              color: Colors.blue,
            ),
            hintText: "Escriba su nombre de usuario",
            labelText: "Usuario"),
        onChanged: (valor) {
          userEdit = valor;
        },
      ),
    );
  }

  Widget _editarPassword() {
    print("paso1 ${errPassedit}");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock_outlined,
            color: Colors.blue,
          ),
          errorText: errPassedit ? null : "Debe ser más de 5 caracteres",
          hintText: "Escriba su contraseña actual",
          labelText: "Contraseña actual",
        ),
        onChanged: (valor) {
          passEdit = valor;
          errPassedit = _passActualEdit();
          print("paso2 ${errPassedit}");
          setState(() {});
        },
      ),
    );
  }

  Widget _passwordActual() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock_clock_outlined,
            color: Colors.blue,
          ),
          hintText: "Escriba su contraseña nueva",
          labelText: "Contraseña nueva",
        ),
        onChanged: (valor) {
          passNew = valor;
        },
      ),
    );
  }

  Widget _confirmarPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock_clock_sharp,
              color: Colors.blue,
            ),
            hintText: "Confirme su contraseña nueva",
            labelText: "Contraseña de confirmacion"),
        onChanged: (valor) {
          passConfirmarda = valor;
        },
      ),
    );
  }

  bool _verificaErrorPass() {
    if (pass.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  bool _habilitarBtn() {
    if (errPass == true && pass.length >= 1 && user.length >= 1) {
      return true;
    }

    return false;
  }

  bool _passActualEdit() {
    if (passEdit.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  void _verificarUser(String user, String pass) async {
    //downloadData();

    Map info = await usuarioProvider.login(user, pass);
    //progress = false;

    if (info['ok']) {
      //print(info['token']);
      // progress = true;
      pass = "";
      user = "";
      Navigator.pushReplacementNamed(context, "home");
    } else {
      //progress = true;
      mostrarAlerta(context, "Verifique el nombre de usuario o contraseña");
    }
  }

  /*  void downloadData() {
    new Timer.periodic(Duration(milliseconds: 1), (Timer timer) {
      setState(() {
        if (progress == 1) {
          timer.cancel();
        } else {
          progress = progress + 0.1;
        }
      });
    });
  } */
}
