import 'package:flutter/material.dart';
import 'package:mis_viajes/pages/menu/menu_opciones.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController mpcontroller;
  String searAddrs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "TAXI",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
        ),
        drawer: Menu_opciones(),
        body: Stack(
          children: [
           /* GoogleMap(
              onMapCreated: onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(2.433, -76.617),
                zoom: 15.0
                ),
            )
            */
          ],
        ));
  }

  void onMapCreated(controller) {
    setState(() {
      mpcontroller = controller;
    });
  }
}
