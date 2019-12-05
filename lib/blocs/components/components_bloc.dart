import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../../models/models.dart';
import '../../resources/resources.dart';
import 'bloc.dart';

class ComponentsBloc extends Bloc<ComponentsEvent, ComponentsState> {
  @override
  ComponentsState get initialState => ComponentsEmpty();

  @override
  Stream<ComponentsState> mapEventToState(ComponentsEvent event) async* {
    if (event is FetchComponents) {
      yield* _mapComponentsToState();
    } else if (event is FetchComponentsById) {
      yield* _mapComponentsByIdToState(event.id);
    }
  }

  Stream<ComponentsState> _mapComponentsToState() async* {
    //TODO: To implement
    throw UnimplementedError();
  }

  Stream<ComponentsState> _mapComponentsByIdToState(String id) async* {
    //TODO: To implement
    throw UnimplementedError();
  }
}
