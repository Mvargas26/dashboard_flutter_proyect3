// import 'package:flutter/material.dart';
// import 'package:proyecto_progra/main.dart';
// import 'package:proyecto_progra/models/manten_servicio_model.dart';
// import 'package:proyecto_progra/models/servicio_model.dart';
// import 'package:proyecto_progra/models/servidor.dart';
// import 'package:proyecto_progra/models/umbral.dart';
// import 'package:proyecto_progra/services/servicios_service.dart';
// import '../models/servidor_model.dart';
// import '../models/servicio.dart';
// import '/models/servidor_nombreModel.dart';
// import '/services/servidores_umbral.dart';
// import '/widget/TextFieldCustom.dart';
// import '/widget/input.dart';

// import 'package:flutter/material.dart';

// class RegistroServicioPage extends StatefulWidget {
//   const RegistroServicioPage({super.key});

//   @override
//   State<RegistroServicioPage> createState() => _RegistroServicioPageState();
// }

// class _RegistroServicioPageState extends State<RegistroServicioPage> {
//   Future<List<ServidorNombre>>? servidor;
//   bool _asyncCall = false;
//   bool _activo = false;
//   final _codigoController = new TextEditingController();
//   final _nombreController = new TextEditingController();
//   final _descripcionController = new TextEditingController();
//   final _tipoController = new TextEditingController();
//   final _servidorPerteneceController = new TextEditingController();
//   final _timeoutController = new TextEditingController();

//   bool _saving = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: Container(),
//       ),
//       appBar: AppBar(
//         title: Text('Servicio',
//             style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 255, 255, 255))),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () {
//              _eliminarServicio();
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.update),
//             onPressed: () {
//               _actualizarServicio();
//             },
//           ),
//         ],
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: Icon(Icons.list_alt_rounded,
//                   color: Color.fromARGB(255, 255, 255, 255),
//                   size: 30), // Tamaño de 30
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//             );
//           },
//         ),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(color: Color.fromARGB(119, 252, 234, 252)),
//         child: SizedBox(
//           child: Stack(
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       _inputServicio(context),
//                       _inputNombre(context),
//                       _inputDescrpcion(context),
//                       _inputTipo(context),
//                       _inputServidor(context),
//                       _inputTimeOut(context),
//                       _registrar(context),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }


//   Widget _inputServicio(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 15.0),
//         child: Column(children: [
//           SizedBox(
//             height: 12,
//           ),
//           TextFieldCustom1(
//               type: TextInputType.text,
//               pass: false,
//               texto: 'Codigo del Servicio',
//               controller: _codigoController),
//           SizedBox(
//             height: 15,
//           ),
//         ]));
//   }

//   Widget _inputNombre(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 15.0),
//         child: Column(children: [
//           TextFieldCustom1(
//               type: TextInputType.text,
//               pass: false,
//               texto: 'Nombre del Servicio',
//               controller: _nombreController),
//           SizedBox(
//             height: 15,
//           ),
//         ]));
//   }

//   Widget _inputDescrpcion(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 15.0),
//         child: Column(children: [
//           TextFieldCustom1(
//               type: TextInputType.text,
//               pass: false,
//               texto: 'Descripción del Servicio',
//               controller: _descripcionController),
//           SizedBox(
//             height: 15,
//           ),
//         ]));
//   }

//   Widget _inputTipo(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 15.0),
//         child: Column(children: [
//           TextFieldCustom1(
//               type: TextInputType.text,
//               pass: false,
//               texto: 'Tipo de Servico',
//               controller: _tipoController),
//           SizedBox(
//             height: 15,
//           ),
//         ]));
//   }

//   Widget _inputServidor(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 15.0),
//         child: Column(children: [
//           TextFieldCustom1(
//               type: TextInputType.text,
//               pass: false,
//               texto: 'Servidor al que pertenece el Servicio',
//               controller: _servidorPerteneceController),
//           SizedBox(
//             height: 15,
//           ),
//         ]));
//   }
//   Widget _inputTimeOut(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 15.0),
//         child: Column(children: [
//           TextFieldCustom1(
//               type: TextInputType.text,
//               pass: false,
//               texto: 'Time Out del Servicio',
//               controller: _timeoutController),
//           SizedBox(
//             height: 15,
//           ),
//         ]));
//   }

//   Widget _registrar(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(2),
//       child: TextButton(
//         onPressed: () {
//           setState(() {
//             _saving = true;
//           });

//           _crearServicio();

//           Navigator.pushNamed(context, 'elegirServidor');
//         },
//         child: Text(
//           'Crear Servicio',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Color.fromARGB(255, 247, 247, 248),
//           ),
//         ),
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(
//             Color.fromARGB(146, 210, 192, 214),
//           ),
//           foregroundColor: MaterialStateProperty.all<Color>(
//             Colors.white,
//           ),
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(50.0),
//               side: BorderSide(
//                 color: Color.fromARGB(146, 210, 192, 214),
//               ),
//             ),
//           ),
//           minimumSize: MaterialStateProperty.all<Size>(
//             Size(200, 50),
//           ),
//         ),
//       ),
//     );
//   }

//   void _crearServicio() async {
//     var c = Servicio(
//         codServicio: '',
//         nombServicio: '',
//         descServicio: '',
//         tipoServicio: '',
//         servidorPertenece: '',
//         timeOut: 0);
//     c.codServicio = _codigoController.text;
//     c.nombServicio = _nombreController.text;
//     c.descServicio = _descripcionController.text;
//     c.tipoServicio = _tipoController.text;
//     c.servidorPertenece = _servidorPerteneceController.text;
//     c.timeOut = int.parse(_timeoutController.text);

//     if (await Servicio_Service.createServicio(c)) {
//       final snackBar = SnackBar(
//         content: Text('Servicio creado con éxito'),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       Navigator.pop(context, c);
//     } else {
//       final snackBar = SnackBar(
//         content: Text('Error al crear el servicio.'),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       setState(() {
//         _saving = false;
//       });
//     }
//   }

// //atualizar
//   void _actualizarServicio() async {
//     var c = Servicio(
//         codServicio: '',
//         descServicio: '',
//         nombServicio: '',
//         tipoServicio: '',
//         servidorPertenece: '',
//         timeOut: 0);
//     c.codServicio = _codigoController.text;
//     c.nombServicio = _nombreController.text;
//     c.descServicio = _descripcionController.text;
//     c.tipoServicio = _tipoController.text;
//     c.servidorPertenece = _servidorPerteneceController.text;
//     c.timeOut = int.parse(_timeoutController.text);

//     if (await Servicio_Service.updateServicio(c)) {
//       final snackBar = SnackBar(
//         content: Text('Servicio actualizado con éxito'),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       Navigator.pop(context, '');
//     } else {
//       final snackBar = SnackBar(
//         content: Text('Error al actualizar el servicio'),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   }

// //Eliminar
//   void _eliminarServicio() async {
//     String server = _codigoController.text;
//     bool resultado = await Servicio_Service.deleteServicio(int.parse(_codigoController.text));
//     if (resultado) {
//       final snackBar = SnackBar(
//         content: Text('Servicio eliminado con éxito'),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       Navigator.pop(
//           context); // me manda a la pagina anterior es decir a la de contacto
//     } else {
//       final snackBar = SnackBar(
//         content: Text('Error eliminando el servicio'),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       // Agregue esta línea
//     }
//   }
// }