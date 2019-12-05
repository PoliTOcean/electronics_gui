import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

abstract class ComponentsState extends Equatable {
  const ComponentsState();

  @override
  List<Object> get props => [];
}

class ComponentsEmpty extends ComponentsState {}

class ComponentsLoading extends ComponentsState {}

class ComponentsLoaded extends ComponentsState {
  final List<Component> components;

  ComponentsLoaded({@required this.components});

  @override
  List<Object> get props => [components];
}

class ComponentsError extends ComponentsState {}
