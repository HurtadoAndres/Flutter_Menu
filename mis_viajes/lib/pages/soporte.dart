
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mis_viajes/bloc/bloc_bloc/chat_bloc.dart';
import 'package:mis_viajes/bloc/bloc_bloc/chat_event.dart';
import 'package:mis_viajes/data/repositories/chat_repository.dart';
import 'package:mis_viajes/pages/ChatsInfo.dart';
 
// ignore: camel_case_types
class soporte extends StatefulWidget {
   static const String ruta = "/soporte";

  @override
  _soporteState createState() => _soporteState();
}

// ignore: camel_case_types
class _soporteState extends State<soporte> {
  final ChatRepository _chatRepository = ChatRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider <ChatBloc>(
      create: (context) => ChatBloc(chatRepository: _chatRepository)
      ..add(LoadChat()),
      child: Scaffold(
        body: ChatInfo(
        ),
      ),
      );
  }
}
