import 'package:flutter/material.dart';

class ayuda extends StatelessWidget {
  static const String ruta = "/ayuda";
  String mensajeTitulo = "Nuestro correo de contacto:\nmis_viajes_ayuda@misviajes.com\n";
  String descripcion = "1.Al hacer el pedido, nadie me ha llamado. vuelve hacer el pedido\n\n2.¿Como puedo dejaralgun comentario al condutor? Despues de finalizado su viaje, se le abrira una ventana donde podra realizarla calificacion y comentario.\n\n3.Cosas olvidadas \nEscribamos al correo: cosasolvidadas@misviajes.com o llamas al numero : 321474758, Este preparado a indicar el itinerario del viaje. Le ayudaremos a solucionar la situacion.";
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
          Text(mensajeTitulo, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            ), textAlign: TextAlign.justify,),
          Text(descripcion, style: TextStyle(
            fontSize: 18,
            ),
            )
        ],)
      )
    );
  }
}
