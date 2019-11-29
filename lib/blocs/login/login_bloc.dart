import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'bloc.dart';

import '../../resources/resources.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({@required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  LoginState get initialState => LoginEmpty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithCredentials) {
      yield* _mapLoginWithCredentialsToState(
          email: event.email, password: event.password);
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsToState(
      {String email, String password}) async* {
    yield LoginLoading();
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield LoginSuccess();
    } catch (e) {
      print(e);
      yield LoginError();
    }
  }
}
