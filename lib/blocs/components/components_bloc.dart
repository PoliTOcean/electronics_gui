import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../../models/models.dart';
import '../../resources/resources.dart';
import 'bloc.dart';

class ComponentsBloc extends Bloc<ComponentsEvent, ComponentsState> {
  final ComponentRepository _componentRepository;

  ComponentsBloc({@required ComponentRepository componentRepository})
      : _componentRepository = componentRepository;

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
          await _componentRepository.fetchComponents();
      yield ComponentsLoaded(components: components);
    } catch (_) {
      yield ComponentsError();
    }
  }
}
