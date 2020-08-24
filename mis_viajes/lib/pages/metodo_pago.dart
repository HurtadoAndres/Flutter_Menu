import 'package:flutter/material.dart';

// ignore: camel_case_types
class pago extends StatelessWidget {
  static const String ruta = "/pago";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Metodo de Pago',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body:Container(
          padding: const EdgeInsets.all(30.0),
            child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text("Efetivo"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.credit_card),
              title: Text("Asociar tarjeta de crdito"),
               onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.payment),
              title: Text("Otros pagos"),
               onTap: (){},
            ),
            
          ],
        )));
  }
}
