import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mis_viajes/bloc/bloc_bloc/viajes_event.dart';
import 'package:mis_viajes/bloc/bloc_bloc/viajes_state.dart';
import 'package:mis_viajes/data/repositories/info_repository.dart';


class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final InfoRepository _infoRepository;
  StreamSubscription _infoSubscription;

  InfoBloc({@required InfoRepository infoRepository}) :assert(infoRepository != null)
  ,_infoRepository = infoRepository , super(null);

  InfoState get initialState => InfoLoading();

  @override
  Stream<InfoState> mapEventToState(InfoEvent event) async* {
    if(event is LoadInfo){
      yield* _mapLoadInfoState();
    }else if(event is InfoUpdated){
      yield* _mapInfoUpdateToState(event);
    }
  }

  Stream<InfoState> _mapLoadInfoState() async*{
    yield InfoLoading();
    _infoSubscription?.cancel();
    try{
      _infoSubscription = _infoRepository.getPosts().listen(
        (infos) => add(InfoUpdated(infos)));
    }catch(_){
      yield InfoLoaded();
    }
  }

  Stream<InfoState> _mapInfoUpdateToState(InfoUpdated event) async* {
    yield InfoLoaded(event.infos);
  }

  @override
  Future<void> close() {
    _infoSubscription?.cancel();
    return super.close();
  }
}