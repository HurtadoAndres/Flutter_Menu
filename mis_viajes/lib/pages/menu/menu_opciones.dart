import 'package:flutter/material.dart';

// ignore: camel_case_types
class Menu_opciones extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu_opciones> {
  Drawer _getDrawer(BuildContext context) {
    ListTile _getItem(Icon icon, String descripcion, String ruta) {
      return ListTile(
        leading: icon,
        title: Text(descripcion),
        onTap: () {
          setState(() {
            Navigator.of(context).pushNamed(ruta);
          });
        },
      );
    }

    ListView listView = new ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            "ANDRES HURTADO",
          ),
          accountEmail: Text("ejemplo@gmail.com"),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://ichef.bbci.co.uk/news/660/cpsprodpb/6AFE/production/_102809372_machu.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRL9X2ZarBF94-Va5nI7Q4f-_z4_iPv_Md3Jw&usqp=CAU"),
          ),
        ),
        _getItem(Icon(Icons.watch_later), "Mis Viajes", "/viajes"),
        Divider(height: 5.0),
        _getItem(Icon(Icons.settings), "Configuraciones", "/configuraciones"),
        Divider(height: 5.0),
        _getItem(Icon(Icons.attach_money), "Metodo de Pago", "/pago"),
        Divider(height: 5.0),
        _getItem(Icon(Icons.security), "Soporte", "/soporte"),
        Divider(height: 5.0),
        _getItem(Icon(Icons.help), "Ayuda", "/ayuda"),
        Divider(height: 5.0),
        _getItem(Icon(Icons.supervisor_account), "Sugerencias", "/sugerencias"),
      ],
    );
     return Drawer(
       child: listView,
     );
  }

  @override
  Widget build(BuildContext context) {
    return  _getDrawer(context);
  }
}
