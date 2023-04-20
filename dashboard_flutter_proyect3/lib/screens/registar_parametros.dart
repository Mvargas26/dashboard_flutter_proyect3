import 'package:flutter/material.dart';

import 'package:proyecto_progra/models/umbral.dart';

import '/models/servidor_nombreModel.dart';
import '/services/servidores_umbral.dart';

import '/widget/input.dart';

class RegistrarParametrosPage extends StatefulWidget {
  const RegistrarParametrosPage({super.key});

  @override
  State<RegistrarParametrosPage> createState() =>
      _RegistrarParametrosPageState();
}

class _RegistrarParametrosPageState extends State<RegistrarParametrosPage> {
  Future<List<ServidorNombre>>? servidor;
  bool _asyncCall = false;
  bool _activo = false;
  final _servidorController = new TextEditingController();
  final _codigoomponenteController = new TextEditingController();
  final _umbralController = new TextEditingController();

  final _porcentajeController = new TextEditingController();
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: _createBody("Nombre del servidor"),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 125, 55, 107).withOpacity(0.4),
        title: Text('Parametros',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _eliminarParametro();
            },
          ),
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () {
              _actualizarusuario();
            },
          ),
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.list_alt_rounded,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 30), // Tamaño de 30
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color.fromARGB(119, 252, 234, 252)),
        child: SizedBox(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _inputServidor(context),
                      _inputUmbral(context),
                      _inputcomponente(context),
                      _inputporeentaje(context),
                      _registrar(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createBody(String nombreServidor) {
     return FutureBuilder(
    future: Umbral_Service.getNombre(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        //entro aqui si hay datos
        return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _servidorController.text = snapshot.data![index].servidor;
                  _umbralController.text = snapshot.data![index].umbral;
                  _codigoomponenteController.text =
                      snapshot.data![index].componente;
                  _porcentajeController.text =
                      snapshot.data![index].porcentaje.toString();
                });
              },
              child: Card(
                color: Color.fromARGB(255, 204, 170, 195).withOpacity(0.4),
                elevation: 4.0,
                margin: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot.data![index].servidor,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text(snapshot.data![index].umbral,
                          style: TextStyle(fontSize: 16.0)),
                      Text(snapshot.data![index].componente,
                          style: TextStyle(fontSize: 16.0)),
                      Text(snapshot.data![index].porcentaje.toString(),
                          style: TextStyle(fontSize: 16.0)),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ),
            );
          },
        );
        } else {
          //entra aqui si no hay datos
          return Center(
            child: TextButton(
              onPressed: () async {
                setState(() {
                  _asyncCall = true;
                });
                servidor = Umbral_Service.getNombre();
                setState(() {
                  _asyncCall = false;
                });
              },
              child: Text("Mostrar Parametros"),
            ),
          );
        }
        //Mientras es una u otra muestra la ruedita
      },
    );
  }

  Widget _inputServidor(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          SizedBox(
            height: 12,
          ),
          TextFieldCustom1(
              type: TextInputType.text,
              pass: false,
              texto: 'Codigo del servidor',
              controller: _servidorController),
          SizedBox(
            height: 15,
          ),
        ]));
  }

  Widget _inputUmbral(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          TextFieldCustom1(
              type: TextInputType.text,
              pass: false,
              texto: 'Parametro de sensibilidad',
              controller: _umbralController),
          SizedBox(
            height: 15,
          ),
        ]));
  }

  Widget _inputcomponente(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          TextFieldCustom1(
              type: TextInputType.text,
              pass: false,
              texto: 'Codigo de componente',
              controller: _codigoomponenteController),
          SizedBox(
            height: 15,
          ),
        ]));
  }

  Widget _inputporeentaje(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          TextFieldCustom1(
              type: TextInputType.text,
              pass: false,
              texto: 'Porcentaje',
              controller: _porcentajeController),
          SizedBox(
            height: 15,
          ),
        ]));
  }

  Widget _registrar(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: TextButton(
        onPressed: () {
          setState(() {
            _saving = true;
          });
          _crearUmbral();

          Navigator.pushNamed(context, 'elegirServidor');
        },
        child: Text(
          'Crear servidor',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 247, 247, 248),
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Color.fromARGB(146, 210, 192, 214),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(
                color: Color.fromARGB(146, 210, 192, 214),
              ),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(200, 50),
          ),
        ),
      ),
    );
  }

  void _crearUmbral() async {
    var c = Umbral(codComp: '', codServer: '', codUmbral: '', porcentaje: 0);
    c.codServer = _servidorController.text;
    c.codUmbral = _umbralController.text;
    c.codComp = _codigoomponenteController.text;
    c.porcentaje = int.tryParse(_porcentajeController.text) ?? 0;

    if (await Umbral_Service.createUmbral(c)) {
      final snackBar = SnackBar(
        content: Text('Parametro creado con éxito'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context, c);
    } else {
      final snackBar = SnackBar(
        content: Text('Error creando el parametro'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        _saving = false;
      });
    }
  }

  void _eliminarParametro() async {
    String server = _servidorController.text;
    String umbralP = _umbralController.text;
    String componente = _codigoomponenteController.text;

    bool resultado =
        await Umbral_Service.eliminarUmbral(server, umbralP, componente);
    if (resultado) {
      final snackBar = SnackBar(
        content: Text('Parametro eliminado con éxito'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(
          context); // me manda a la pagina anterior es decir a la de contacto
    } else {
      final snackBar = SnackBar(
        content: Text('Error eliminando el parametro'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Agregue esta línea
    }
  }

  void _actualizarusuario() async {
    var c = Umbral(codComp: '', codServer: '', codUmbral: '', porcentaje: 0);
    c.codServer = _servidorController.text;
    c.codUmbral = _umbralController.text;
    c.codComp = _codigoomponenteController.text;
    c.porcentaje = int.tryParse(_porcentajeController.text) ?? 0;

    if (await Umbral_Service.ediparametro(c)) {
      final snackBar = SnackBar(
        content: Text('Parametro actualizado con éxito'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context, ' ');
    } else {
      final snackBar = SnackBar(
        content: Text('Error actualizando parametro'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
