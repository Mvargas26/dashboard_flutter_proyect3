import 'package:flutter/material.dart';
import 'package:proyecto_progra/main.dart';
import 'package:proyecto_progra/models/servidor.dart';
import 'package:proyecto_progra/models/umbral.dart';
import '../models/servidor_model.dart';
import '/models/servidor_nombreModel.dart';
import '/services/servidores_umbral.dart';
import '/widget/TextFieldCustom.dart';
import '/widget/input.dart';

class MantenimientoServiidorPage extends StatefulWidget {
  const MantenimientoServiidorPage({super.key});

  @override
  State<MantenimientoServiidorPage> createState() =>
      _MantenimientoServiidorPageState();
}

class _MantenimientoServiidorPageState
    extends State<MantenimientoServiidorPage> {
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


   body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          
            color:Color.fromARGB(119, 252, 234, 252)
            
          
          ),
        
         child: SizedBox(
  child: Stack(
    children: [
            _inputBuscar(),
            _createBody("Nombre del servidor")
            ],
         
  ),
),





        ),
      
    );
  }

  @override
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
                    Text(snapshot.data![index].umbral),
                    Text(snapshot.data![index].componente),
                    Text(snapshot.data![index].porcentaje.toString()),
                  ],
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
              child: Text("Mostrar servidores"),
            ),
          );
        }
        //Mientras es una u otra muestra la ruedita
      },
    );
  }

  Widget _inputBuscar(){
  return Row(
    children: [
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Nombre de usuario.',
          ),
        ),
      ),
      IconButton(
        icon: Icon(Icons.search_rounded),
        onPressed: () {},
      ),
    ],
  );
}

    

  }






