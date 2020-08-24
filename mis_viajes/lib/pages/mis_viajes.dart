import 'package:flutter/material.dart';
import 'package:mis_viajes/pages/informacion.dart';

// ignore: camel_case_types
class viajes extends StatelessWidget {
  static const String ruta = "/viajes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis viajes',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        
      ),
      body: Informacion(),
    );
  }
}
