import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class Firebase {
  final String _apiKey = "AIzaSyB_OkffGppkmKL4XXUquL3ulYo5--5FvRM";
  final String _authDomain = "politocean-a23cc.firebaseapp.com";
  final String _databaseURL = "https://politocean-a23cc.firebaseio.com";
  final String _projectId = "politocean-a23cc";
  final String _storageBucket = "politocean-a23cc.appspot.com";
  final String _messagingSenderId = "465166232104";
  final String _appId = "1:465166232104:web:677e5ed3a2c42c7c19a31d";
  final String _measurementId = "G-2QGXBG6X57";

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
