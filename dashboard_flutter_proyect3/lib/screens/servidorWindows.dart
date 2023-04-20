import 'package:flutter/material.dart';

class ServidorWPage extends StatefulWidget {
  const ServidorWPage({super.key});

  @override
  State<ServidorWPage> createState() => _ServidorWPageState();
}

class _ServidorWPageState extends State<ServidorWPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  title: Text(
    'Servidores',
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  flexibleSpace: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(226, 139, 66, 121),
          Color.fromARGB(255, 190, 193, 239),
          
        ],
      ),
    ),
  ),
),
      body: Container(
        //se usa para poner el fondo
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      color: Colors.white,
         child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         
       _registrar(context)
          
        ],
      ),
      ),
    );
  }


Widget _registrar(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(2),
    child: TextButton(
      onPressed: () {
        Navigator.pushNamed(context, '');
      },
      child: Text(
        'Servicios',
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


}