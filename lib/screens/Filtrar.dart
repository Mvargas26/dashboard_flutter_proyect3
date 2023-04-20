import 'package:flutter/material.dart';
import '/models/filtrarPorNombreModel.dart';
import '/services/filtrarServer.dart';
 class filtrarPage extends StatefulWidget {
   const filtrarPage({super.key});

  @override
  State<filtrarPage> createState() => _filtrarPageState();
}

class _filtrarPageState extends State<filtrarPage> {
  final TextEditingController _servidorController = TextEditingController();
  List<ServidorNombre1>? _servidores;

   @override
  
  Widget build(BuildContext context) {
    return Scaffold(

 drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
          child: Column(children: [
              SizedBox(
              height: 60,
            ),
            TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, 'registrarParametros'),
                child: Text('Parametros de sensibilidad',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 34, 42)))),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, 'registrarServidor'),
                child: Text('Servidor',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 33, 34, 42)))),
            SizedBox(
              height: 20,
            ),
          
           
          ]),
        ),
      ),
      appBar: AppBar(
        title: Text('Servidores',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255))),
      ),

   body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _servidorController,
                decoration: InputDecoration(
                  hintText: 'Nombre del servidor',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final servidores = await filtrarServidor_Service.filtrarServidores(_servidorController.text);
                setState(() {
                  _servidores = servidores;
                });
              },
            ),
          ],
        ),
      ),
      SizedBox(height: 16),
      _servidores != null
        ? Expanded(
            child: ListView.builder(
              itemCount: _servidores!.length,
              itemBuilder: (BuildContext context, int index) {
                final servidor = _servidores![index];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(servidor.servidor),
                      Text(servidor.nombre),
                      Text(servidor.descripcion),
                      Text(servidor.administrador),
                      Text(servidor.contrasena),
                      Text(servidor.umbral),
                      Text(servidor.componente),
                      Text(servidor.porcentaje.toString()),
                    ],
                  ),
                );
              },
            ),
          )
        : Container(),
    ],
  ),
),
    );

  }
   }

   
