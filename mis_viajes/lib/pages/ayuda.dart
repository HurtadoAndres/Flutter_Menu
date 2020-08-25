import 'package:flutter/material.dart';

// ignore: camel_case_types
// ignore: must_be_immutable
// ignore: camel_case_types
// ignore: must_be_immutable
// ignore: camel_case_types
// ignore: must_be_immutable
// ignore: camel_case_types
class ayuda extends StatelessWidget {
  static const String ruta = "/ayuda";
  String MensajeTitulo = "Nuestro correo de contacto:\nmis_viajes_ayuda@misviajes.com\n";
  String Descripcion = "1.Al hacer el pedido, nadie me ha llamado. vuelve hacer el pedido\n\n2.¿Como puedo dejaralgun comentario al condutor? Despues de finalizado su viaje, se le abrira una ventana donde podra realizarla calificacion y comentario.\n\n3.Cosas olvidadas \nEscribamos al correo: cosasolvidadas@misviajes.com o llamas al numero : 321474758, Este preparado a indicar el itinerario del viaje. Le ayudaremos a solucionar la situacion.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ayuda',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(MensajeTitulo, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            ), textAlign: TextAlign.justify,),
          Text(Descripcion, style: TextStyle(
            fontSize: 18,
            ),
            )
        ],)
      )
    );
  }
}
