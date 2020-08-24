import 'package:equatable/equatable.dart';
import 'package:mis_viajes/data/models/info.dart';




abstract class InfoState extends Equatable{
  const InfoState();

  @override
  List<Object> get props => [];
}

//tres estados
//info loading la informacion se esta cargando normalmente
class Infoinitial extends InfoState{

}
// la info se han cargado
//la info no se pudo cargar 

class InfoLoading extends InfoState {
  @override
  String toString() => "Info loading";
}

class InfoLoaded extends InfoState{
  final List<Info> infos;

  const InfoLoaded([this.infos]);

  @override
  List<Object> get props => [infos];

  @override
  String toString() => "Info loade";

}

class InfoNoLoaded extends InfoState{
  @override
  String toString() => "Info No Loaded";
}