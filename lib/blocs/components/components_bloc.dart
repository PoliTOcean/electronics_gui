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
    }
  }

  Stream<ComponentsState> _mapComponentsToState() async* {
    yield ComponentsLoading();
    try {
      final List<Component> components =
          await Repository.componentRepository.fetchComponents();
      yield ComponentsLoaded(components: components);
    } catch (_) {
      yield ComponentsError();
    }
  }
}
