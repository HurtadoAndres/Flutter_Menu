import 'package:equatable/equatable.dart';
import 'package:mis_viajes/data/models/info.dart';




abstract class InfoEvent extends Equatable{
  const InfoEvent();

  @override
  List<Object> get props => [];
}

class LoadInfo extends InfoEvent{}

class InfoUpdated extends InfoEvent{
  final List<Info> infos;

  const InfoUpdated(this.infos);


  List<Object> get props => [infos];
}