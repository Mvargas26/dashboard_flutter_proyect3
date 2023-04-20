import 'package:flutter/material.dart';
import 'package:proyecto_progra/main.dart';
import 'package:proyecto_progra/models/servidor.dart';
import 'package:proyecto_progra/models/umbral.dart';
import '../models/servidor_model.dart';
import '/models/servidor_nombreModel.dart';
import '/services/servidores_umbral.dart';
import '/widget/TextFieldCustom.dart';
import '/widget/input.dart';

class RegistrarServidorPage extends StatefulWidget {
  const RegistrarServidorPage({super.key});

  @override
  State<RegistrarServidorPage> createState() => _RegistrarServidorPageState();
}

class _RegistrarServidorPageState extends State<RegistrarServidorPage> {
  Future<List<ServidorNombre>>? servidor;
  bool _asyncCall = false;
  bool _activo = false;
  final _servidorController = new TextEditingController();
  final _nombreController = new TextEditingController();
  final _descripcionController = new TextEditingController();
  final _admiRegistraController = new TextEditingController();
  final _contrasenaController = new TextEditingController();
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
        title: Text('Servidor',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _eliminarServidor();
            },
          ),
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () {
              _actualizarServidor();
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
                      _inputNombre(context),
                      _inputDescrpcion(context),
                      _inputadmi(context),
                      _inputpass(context),
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
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data![index].servidor),
                    Text(snapshot.data![index].nombre),
                    Text(snapshot.data![index].descripcion),
                    Text(snapshot.data![index].administrador),
                    Text(snapshot.data![index].contrasena),
                  ],
                ),
                onTap: () {
                  setState(() {
                    _servidorController.text = snapshot.data![index].servidor;
                    _nombreController.text = snapshot.data![index].nombre;
                    _descripcionController.text =
                        snapshot.data![index].descripcion;
                    _admiRegistraController.text =
                        snapshot.data![index].administrador;
                    _contrasenaController.text =
                        snapshot.data![index].contrasena;
                  });
                },
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
              child: Text("Mostrar servidores"),
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

  Widget _inputNombre(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          TextFieldCustom1(
              type: TextInputType.text,
              pass: false,
              texto: 'Nombre del servidor',
              controller: _nombreController),
          SizedBox(
            height: 15,
          ),
        ]));
  }

  Widget _inputDescrpcion(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          TextFieldCustom1(
              type: TextInputType.text,
              pass: false,
              texto: 'Descripción del servidor',
              controller: _descripcionController),
          SizedBox(
            height: 15,
          ),
        ]));
  }

  Widget _inputadmi(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          TextFieldCustom1(
              type: TextInputType.text,
              pass: false,
              texto: 'Usaurio Administrador',
              controller: _admiRegistraController),
          SizedBox(
            height: 15,
          ),
        ]));
  }

  Widget _inputpass(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(children: [
          TextFieldCustom1(
              type: TextInputType.text,
              pass: false,
              texto: 'Contraseña',
              controller: _contrasenaController),
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

          _crearservidor();

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

  void _crearservidor() async {
    var c = ServidoresR(
        codServidor: '',
        descServidor: '',
        nombServidor: '',
        passServidor: '',
        userAdmiServidor: '');
    c.codServidor = _servidorController.text;
    c.nombServidor = _nombreController.text;
    c.descServidor = _descripcionController.text;
    c.passServidor = _contrasenaController.text;
    c.userAdmiServidor = _admiRegistraController.text;

    if (await Umbral_Service.createServidor(c)) {
      final snackBar = SnackBar(
        content: Text('Servidor creado con éxito'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context, c);
    } else {
      final snackBar = SnackBar(
        content: Text('Servidor creado con éxito'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        _saving = false;
      });
    }
  }

//atualizar
  void _actualizarServidor() async {
    var c = ServidoresR(
        codServidor: '',
        descServidor: '',
        nombServidor: '',
        passServidor: '',
        userAdmiServidor: '');
    c.codServidor = _servidorController.text;
    c.nombServidor = _nombreController.text;
    c.descServidor = _descripcionController.text;
    c.passServidor = _contrasenaController.text;
    c.userAdmiServidor = _admiRegistraController.text;

    if (await Umbral_Service.editarServidor(c)) {
      final snackBar = SnackBar(
        content: Text('Servidor actualizado con éxito'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context, '');
    } else {
      final snackBar = SnackBar(
        content: Text('Servidor actualizado con éxito'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

//Eliminar
  void _eliminarServidor() async {
    String server = _servidorController.text;
    bool resultado = await Umbral_Service.eliminarServidor(server);
    if (resultado) {
      final snackBar = SnackBar(
        content: Text('Servidor eliminado con éxito'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(
          context); // me manda a la pagina anterior es decir a la de contacto
    } else {
      final snackBar = SnackBar(
        content: Text('Error eliminando el servidor'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Agregue esta línea
    }
  }
}
