import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class Firebase {
  final String _apiKey = "AIzaSyDZ8qfIC7lbxv0kjYObHo9mCitw8oJhNis";
  final String _authDomain = "politocean-3b8e9.firebaseapp.com";
  final String _databaseURL = "https://politocean-3b8e9.firebaseio.com";
  final String _projectId = "politocean-3b8e9";
  final String _storageBucket = "politocean-3b8e9.appspot.com";
  final String _messagingSenderId = "616005941472";
  final String _appId = "1:616005941472:web:abf2ff0718412fb340f885";
  final String _measurementId = "G-GS24QHX72D";

  final http.Client httpClient;

  Firebase({@required this.httpClient});
}

class FirebaseAuth extends Firebase {
  final String _baseUrl = "https://identitytoolkit.googleapis.com/v1/accounts";

  User _currentUser;
  User get currentUser => _currentUser;

  FirebaseAuth()
      : _currentUser = null,
        super(httpClient: http.Client());

  static final FirebaseAuth instance = FirebaseAuth();

  Future<void> signInWithEmailAndPassword(
      {@required String email, @required String password}) async {
    final url = '$_baseUrl:signInWithPassword?key=$_apiKey';
    final response = await httpClient.post(url, body: {
      'email': email,
      'password': password,
      'returnSecureToken': 'true'
    });

    if (response.statusCode != 200) {
      throw Exception("Signin failed.");
    }

    _currentUser = User.fromJson(json.decode(response.body));
  }
}
