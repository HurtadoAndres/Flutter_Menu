import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mis_viajes/bloc/bloc_bloc/chat_event.dart';
import 'package:mis_viajes/bloc/bloc_bloc/chat_state.dart';
import 'package:mis_viajes/data/repositories/chat_repository.dart';



class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository _chatRepository;
  StreamSubscription _chatSubscription;

  ChatBloc({@required ChatRepository chatRepository}) :assert(chatRepository != null)
  ,_chatRepository = chatRepository , super(null);

  ChatState get initialState => ChatLoading();

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if(event is LoadChat){
      yield* _mapLoadChatState();
    }else if(event is AddChats){
      yield* _mapChatAddChatToState(event);
    }
    else if(event is ChatUpdated){
      yield* _mapChatUpdateToState(event);
    }
  }

  Stream<ChatState> _mapLoadChatState() async*{
    yield ChatLoading();
    _chatSubscription?.cancel();
    try{
      _chatSubscription = _chatRepository.getPosts().listen(
        (chats) => add(ChatUpdated(chats)));
    }catch(_){
      yield ChatLoaded();
    }
  }

  Stream<ChatState> _mapChatUpdateToState(ChatUpdated event) async* {
    yield ChatLoaded(event.chats);
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    return super.close();
  }

  Stream<ChatState> _mapChatAddChatToState(AddChats event) async*{
    await _chatRepository.putChats(event.name, event.mensaje);
  }
}