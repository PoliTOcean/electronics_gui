import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import 'resources/resources.dart';
import 'blocs/blocs.dart';
import 'app.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

void main() {
  // Override for desktop embedding
  WidgetsFlutterBinding.ensureInitialized();

  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  BlocSupervisor.delegate = SimpleBlocDelegate();

  final AuthRepository authRepository = AuthRepository.instance;

  runApp(BlocProvider(
      create: (context) =>
          AuthenticationBloc(authRepository: authRepository)..add(AppStarted()),
      child: App(authRepository: authRepository)));
}
