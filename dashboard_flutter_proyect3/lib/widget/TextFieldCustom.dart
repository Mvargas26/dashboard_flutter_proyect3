import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
 final IconData icono;
  final TextInputType type;
  final bool pass;
  final String texto;
  final TextEditingController controller;

  const TextFieldCustom({
    required this.icono,
    required this.type,
    required this.pass,
    required this.texto,
    required this.controller
  });

  // Añade `this.controller` aquí

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      //obscureText: pass,
      controller: controller, // Añade esto
      decoration: InputDecoration(
        hintText: texto,
        
        filled: true,
        fillColor: Color.fromARGB(146, 210, 192, 214),
        prefixIcon: Icon(icono,color:Color.fromARGB(255, 255, 255, 255)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color:Color.fromARGB(146, 210, 192, 214)),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(146, 210, 192, 214)),
          borderRadius: BorderRadius.circular(50),
        ),
        hintStyle: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 20,
      ),
      ),
    );
  }
}
