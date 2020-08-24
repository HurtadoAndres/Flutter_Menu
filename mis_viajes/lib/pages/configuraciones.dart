import 'package:flutter/material.dart';

// ignore: camel_case_types
class configuraciones extends StatelessWidget {
  static const String ruta = "/configuraciones";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Configuraciones',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
        ),
        body: Container(
          padding: const EdgeInsets.all(30.0),
            child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.smartphone),
              title: Text("Cambiar numero de telefono"),
              onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.language),
              title: Text("Idiomas"),
               onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.insert_emoticon),
              title: Text("Acerca de la aplicacion"),
               onTap: (){},
            ),
             ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Cerrar sesion"),
               onTap: (){},
            ),
          ],
        )));
  }
}
