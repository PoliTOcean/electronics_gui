import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ComponentsEvent extends Equatable {
  const ComponentsEvent();

  @override
  List<Object> get props => [];
}

class FetchComponents extends ComponentsEvent {}

class FetchComponentsById extends ComponentsEvent {
  final String id;

  FetchComponentsById({@required this.id});

  @override
  List<Object> get props => [id];
}
