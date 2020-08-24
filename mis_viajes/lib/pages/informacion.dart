
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mis_viajes/bloc/bloc_bloc/viajes_bloc.dart';
import 'package:mis_viajes/data/repositories/info_repository.dart';
import 'package:mis_viajes/bloc/bloc_bloc/viajes_event.dart';
import 'package:mis_viajes/pages/viajes_page.dart';
 
class Informacion extends StatelessWidget {
  final InfoRepository _infoRepository = InfoRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider <InfoBloc>(
      create: (context) => InfoBloc(infoRepository: _infoRepository)
      ..add(LoadInfo()),
      child: Scaffold(
        body: ViajesPage(),
      ),
      );
  }
}