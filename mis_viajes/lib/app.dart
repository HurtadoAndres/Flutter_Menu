import 'package:flutter/material.dart';
import 'package:mis_viajes/pages/home.dart';
import 'package:mis_viajes/pages/ayuda.dart';
import 'package:mis_viajes/pages/configuraciones.dart';
import 'package:mis_viajes/pages/metodo_pago.dart';
import 'package:mis_viajes/pages/mis_viajes.dart';
import 'package:mis_viajes/pages/soporte.dart';
import 'package:mis_viajes/pages/sugerencias.dart';

 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
       home: Home(),
      routes: <String, WidgetBuilder>{
        configuraciones.ruta: (BuildContext context) => configuraciones(),
        pago.ruta: (BuildContext context) => pago(),
        soporte.ruta: (BuildContext context) => soporte(),
        sugerencias.ruta: (BuildContext context) => sugerencias(),
        ayuda.ruta: (BuildContext context) => ayuda(),
        viajes.ruta: (BuildContext context) => viajes(),

      },
      
    );
  }
}