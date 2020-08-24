import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mis_viajes/bloc/bloc_bloc/viajes_bloc.dart';
import 'package:mis_viajes/bloc/bloc_bloc/viajes_state.dart';
import 'package:mis_viajes/data/models/info.dart';

class ViajesPage extends StatefulWidget {
  ViajesPage({Key key}) : super(key: key);

  @override
  _ViajesPageState createState() => _ViajesPageState();
}

class _ViajesPageState extends State<ViajesPage> {
  List<Info> infoList = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoBloc, InfoState>(
      builder: (context, state) {
        if (state is InfoLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is InfoNoLoaded) {
          return Center(
            child: Column(children: <Widget>[
              Icon(Icons.error),
              Text("Cannot Load post")
            ]),
          );
        }
        if (state is InfoLoaded) {
          infoList = state.infos;
          return Container(
            child: infoList.length == 0
                ? Center(
                    child: Text("No Info Avaliable"),
                  )
                : ListView.builder(
                    itemCount: infoList.length,
                    itemBuilder: (_, index) {
                      return infosUI(
                          infoList[index].fecha,
                          infoList[index].direcion1,
                          infoList[index].direcion2,
                          infoList[index].precio,
                          infoList[index].estado,
                          context);
                    }),
          );
        }
        return Container();
      },
    );
  }
}

Widget infosUI(String fecha, String direcion1, String direcion2, String precio,
    String estado, BuildContext context) {
  return Card(
    elevation: 5.0,
    margin: EdgeInsets.all(10.0),
    child: Container(
        padding: EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Fecha : " + fecha,
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.start),
                SizedBox(height: 10.0),
                Text("Direcion : " + direcion1,
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.start),
                SizedBox(height: 10.0),
                Text("Direcion : " + direcion2,
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.start),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Precio : " + precio,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.start),
                    Text(estado,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.start),
                  ],
                )
              ],
            ),
            SizedBox(height: 10.0),
          ],
        )),
  );
}
