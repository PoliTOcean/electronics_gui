import 'package:flutter/material.dart';

class Router {
  static const String homeRoute = '/';
  static const String loginRoute = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (context) => Container());
      case loginRoute:
        return MaterialPageRoute(builder: (context) => Container());
      default:
        return null;
    }
  }
}
