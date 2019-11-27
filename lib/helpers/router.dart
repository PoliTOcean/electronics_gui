import 'package:flutter/material.dart';

import '../views/views.dart';

class Router {
  static const String homeRoute = '/';
  static const String loginRoute = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (context) => HomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (context) => LoginPage());
      default:
        return null;
    }
  }
}
