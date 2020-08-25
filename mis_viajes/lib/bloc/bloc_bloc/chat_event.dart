import 'package:equatable/equatable.dart';
import 'package:mis_viajes/data/models/chat.dart';

abstract class ChatEvent extends Equatable{
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class LoadChat extends ChatEvent{}

class ChatUpdated extends ChatEvent{
  final List<Chat> chats;

  const ChatUpdated(this.chats);


  List<Object> get props => [chats];
}

class AddChats extends ChatEvent{
  final String mensaje;
  final String name;

  const AddChats(this.mensaje, this.name);

  List<Object> get props => [mensaje, name];

  @override
  String toString() => "Adding chats";
}

