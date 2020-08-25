import 'package:equatable/equatable.dart';
import 'package:mis_viajes/data/models/chat.dart';




abstract class ChatState extends Equatable{
  const ChatState();

  @override
  List<Object> get props => [];
}

//tres estados
//info loading la informacion se esta cargando normalmente
class Infoinitial extends ChatState{

}
// la info se han cargado
//la info no se pudo cargar 

class ChatLoading extends ChatState {
  @override
  String toString() => "Chat loading";
}

class ChatLoaded extends ChatState{
  final List<Chat> chats;

  const ChatLoaded([this.chats]);

  @override
  List<Object> get props => [chats];

  @override
  String toString() => "Chat loade";

}

class ChatNoLoaded extends ChatState{
  @override
  String toString() => "Chat No Loaded";
}