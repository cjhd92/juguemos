import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/get_rule_provider.dart';

class LimitarB extends StatelessWidget {
  //const LimitarB({super.key});

  static final String routeName = "limitarB";

  final rulesProvider = new RulesProvider();
  int centenaSize = 0;
  int fijoSize = 0;
  int corridoSize = 0;
  List fijoList = [];
  List centenaList = [];
  List corridoList = [];

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
        body: FutureBuilder(
            future: rulesProvider.rules(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                //print(snapshot.data);

                if (snapshot.data["fijo_limited"] == null) {
                  corridoSize = 0;
                } else {
                  fijoList = snapshot.data["fijo_limited"];
                  fijoSize = fijoList.length;
                }

                if (snapshot.data["corrido_limited"] == null) {
                  corridoSize = 0;
                } else {
                  corridoList = snapshot.data["corrido_limited"];
                  corridoSize = corridoList.length;
                }

                if (snapshot.data["centena_limited"] == null) {
                  centenaSize = 0;
                } else {
                  centenaList = snapshot.data["centena_limited"];
                  centenaSize = centenaList.length;
                }
                /*  corridoList = snapshot.data["corrido_limited"];
                corridoSize = corridoList.length; */

                /*  print(corridoList);
                print(corridoSize); */

                return Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10.0),
                    child: Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 5),
                          Text(
                            "Regals por jornada: ${snapshot.data["session"]}",
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 5),
                              Text(
                                "Fijo:",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.blue),
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          fijoSize == 0
                              ? Text("No hay fijos limitados en esta jornada",
                                  style: TextStyle(
                                      background: Paint()
                                        ..color =
                                            Color.fromRGBO(33, 150, 243, 0.1)))
                              : Row(
                                  children: [
                                    Wrap(
                                      children:
                                          List.generate(fijoSize, (index) {
                                        return FijosLimitados(index);
                                      }),
                                    ),
                                  ],
                                ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 5),
                              Text(
                                "Corrido:",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.blue),
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          corridoSize == 0
                              ? Text(
                                  "No hay corridos limitados en esta jornada",
                                  style: TextStyle(
                                      background: Paint()
                                        ..color =
                                            Color.fromRGBO(33, 150, 243, 0.1)))
                              : Row(
                                  children: [
                                    Wrap(
                                      children:
                                          List.generate(corridoSize, (index) {
                                        return corridoLimitados(index);
                                      }),
                                    ),
                                  ],
                                ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 5),
                              Text(
                                "Centena:",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.blue),
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          centenaSize == 0
                              ? Text(
                                  "No hay centenas limitadas en esta jornada",
                                  style: TextStyle(
                                      background: Paint()
                                        ..color =
                                            Color.fromRGBO(33, 150, 243, 0.1)))
                              : Row(
                                  children: [
                                    Wrap(
                                      children:
                                          List.generate(centenaSize, (index) {
                                        return CentenaLimitados(index);
                                      }),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ));
              }
            }));
  }

  Widget FijosLimitados(index) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(left: 1, right: 1, bottom: 10),
      child: Center(child: Text(fijoList[index].toString())),
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget corridoLimitados(index) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(left: 1, right: 1, bottom: 10),
      child: Center(child: Text(corridoList[index].toString())),
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget CentenaLimitados(index) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(left: 1, right: 1, bottom: 10),
      child: Center(child: Text(centenaList[index].toString())),
      decoration: BoxDecoration(
          color: Colors.blueAccent, borderRadius: BorderRadius.circular(10)),
    );
  }
}
