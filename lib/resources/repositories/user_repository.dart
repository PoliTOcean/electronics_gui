import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../models/models.dart';
import 'base_repository.dart';

class UserRepository extends BaseRepository {
  final http.Client httpClient;

  UserRepository({@required this.httpClient});

  static final instance = UserRepository(httpClient: http.Client());

  Future<List<User>> getUsers({String search}) async {
    final url =
        (search == null) ? '$baseUrl/users' : '$baseUrl/users/?search=$search';
    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception();
    }

    List<User> users = [];
    json
        .decode(response.body)['results']
        .forEach((user) => users.add(User.fromJson(user)));

    return users;
  }

  Future<User> getUser({@required id}) async {
    final url = '$baseUrl/users/$id';
    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception();
    }

    return User.fromJson(json.decode(response.body)['results']);
  }
}
