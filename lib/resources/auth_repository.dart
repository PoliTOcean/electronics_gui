import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';
import 'repository.dart';

class AuthRepository extends Repository {
  User _currentUser;
  User get currentUser => _currentUser;

  final http.Client httpClient;

  AuthRepository({@required this.httpClient}) : _currentUser = null;

  static final instance = AuthRepository(httpClient: http.Client());

  Future<void> signinWithEmailAndPassword(
      {@required String email, @required String password}) async {
    final url = '$baseUrl/auth';
    final request = await httpClient
        .post(url, body: {'email': email, 'password': password});

    if (request.statusCode != 200) {
      throw Exception();
    }

    return User.fromJson(json.decode(request.body)['result']);
  }

  bool isUserSignedIn() => (_currentUser != null);
}
