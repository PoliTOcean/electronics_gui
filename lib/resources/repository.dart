import 'repositories/auth_repository.dart';
import 'repositories/user_repository.dart';
import 'repositories/component_repository.dart';

class Repository {
  static final AuthRepository authRepository = AuthRepository.instance;
  static final UserRepository userRepository = UserRepository.instance;
  static final ComponentRepository componentRepository =
      ComponentRepository.instance;
}
