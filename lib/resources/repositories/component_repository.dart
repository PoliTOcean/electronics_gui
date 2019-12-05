import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../models/models.dart';
import 'base_repository.dart';

class ComponentRepository extends BaseRepository {
  final http.Client httpClient;

  ComponentRepository({@required this.httpClient});

  static final instance = ComponentRepository(httpClient: http.Client());

  Future<List<Component>> fetchComponents({String search}) async {
    final url = (search == null)
        ? '$baseUrl/components'
        : '$baseUrl/components/?search=$search';
    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception();
    }

    List<Component> components = [];
    json
        .decode(response.body)['results']
        .forEach((component) => components.add(Component.fromJson(component)));

    return components;
  }

  Future<Component> fetchComponentById(String id) async {
    final url = '$baseUrl/components/$id';
    final response = await httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception();
    }

    return Component.fromJson(json.decode(response.body)['result']);
  }
}
