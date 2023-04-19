import 'package:flutter/material.dart';
import 'package:proyecto_progra/screens/detallarServidor.dart';
import 'package:proyecto_progra/services/staticC.dart';

import '../models/servidor_model.dart';
import '../services/servidor_service.dart';

class ElegirSeridorPage extends StatefulWidget {
  const ElegirSeridorPage({super.key});

  @override
  State<ElegirSeridorPage> createState() => _ElegirSeridorPageState();
}

class _ElegirSeridorPageState extends State<ElegirSeridorPage> {
  //VARIABLES
  Future<List<Servidor_Model>?>? listadoServidores;
  bool _asynCall = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: createBody()
        // Container(

        //   //se usa para poner el fondo
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height,
        //   decoration: BoxDecoration(
        //     gradient: new LinearGradient(
        //       colors: [
        //         Color.fromARGB(129, 139, 66, 121).withOpacity(0.4),
        //         Color.fromARGB(129, 139, 66, 121).withOpacity(0.4),
        //       ],
        //     ),
        //   ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Expanded(child: mantenimiento(context)),
        //       Expanded(child: mantenimiento2(context)),
        //     ],
        //   ),
        // ),
        );
  }

  Widget mantenimiento(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Container(
        margin: EdgeInsets.only(top: 150),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'servidorW');
                  },
                  child: Container(
                    height: 160,
                    width: 160,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(53, 255, 255, 255),
                      borderRadius: BorderRadius.circular(21),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset('assets/imagenes/windows.png'),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'servidorW');
                  },
                  child: Container(
                    height: 160,
                    width: 160,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(53, 255, 255, 255),
                      borderRadius: BorderRadius.circular(21),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset('assets/imagenes/Linux.png'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget mantenimiento2(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Container(
        margin: EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'servidorW');
                  },
                  child: Container(
                    height: 160,
                    width: 160,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(53, 255, 255, 255),
                      borderRadius: BorderRadius.circular(21),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text('Mantenimiento de servidores'),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'servidorW');
                  },
                  child: Container(
                    height: 160,
                    width: 160,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(53, 255, 255, 255),
                      borderRadius: BorderRadius.circular(21),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text('Mantenimiento de servicios'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget createBody() {
    return FutureBuilder(
      future: listadoServidores,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //entro aqui si hay datos
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  StaticC.idServidor = snapshot.data![index]
                      .codServidor; //aqui guardamos el id seleccionado
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              DetallarServidor(snapshot.data![index])));
                },
                onLongPress: () {},
                title: Text(snapshot.data![index].codServidor),
                subtitle: Text(snapshot.data![index].nombServidor),
              );
            },
          );
        } else {
          //entra aqui si no hay datos
          return Center(
            child: TextButton(
              onPressed: () async {
                setState(() {
                  _asynCall = true;
                });
                listadoServidores = Servidor_Service.getServidores();
                setState(() {
                  _asynCall = false;
                });
              },
              child: Text("Ver Servidores"),
            ),
          );
        }
        //Mientras es una u otra muestra la ruedita
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}//fin class
