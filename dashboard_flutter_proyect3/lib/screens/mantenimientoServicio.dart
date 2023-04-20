import 'package:flutter/material.dart';
import 'package:proyecto_progra/services/servicios_service.dart';

import '../services/manten_servicio_services.dart';

class MantenimientoServicioPage extends StatefulWidget {

  @override
  State<MantenimientoServicioPage> createState() => _MantenimientoServicioPageState();
}

class _MantenimientoServicioPageState extends State<MantenimientoServicioPage> {
  
  bool _asyncCall = false;
  final _codigoController = new TextEditingController();
  final _nombreController = new TextEditingController();
  final _descripcionController = new TextEditingController();
  final _tipoController = new TextEditingController();
  final _servidorPerteneceController = new TextEditingController();
  
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
                onPressed: () => Navigator.pushNamed(context, 'registrarServicio'),
                child: Text('Servicio',
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
        title: Text('Servicios',
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
            // _createBody()
            ],
         
  ),
),



        ),
      
    );
  }

// @override
//   Widget _createBody() {
//     return FutureBuilder(
//       future: Servicio_Service.getServicio(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           //entro aqui si hay datos
//           return ListView.builder(
//             itemCount: snapshot.data?.length,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 title: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(snapshot.data![index].codServicio),
//                     Text(snapshot.data![index].nombServicio),
//                     Text(snapshot.data![index].descServicio),
//                     Text(snapshot.data![index].tipoServicio),
//                     Text(snapshot.data![index].servidorPertenece),
//                     Text(snapshot.data![index].timeOut.toString()),
//                   ],
//                 ),
              
//               );
//             },
//           );
//         } else {
//           //entra aqui si no hay datos
//           return Center(
//             child: TextButton(
//               onPressed: () async {
//                 Servicio_Service.getServicio();
//                 setState(() {
//                   _asyncCall = true;
//                 });
//                 setState(() {
//                   _asyncCall = false;
//                 });
//               },
//               child: Text("Mostrar servicios"),
//             ),
//           );
//         }
//         //Mientras es una u otra muestra la ruedita
//       },
//     );
//   }

}