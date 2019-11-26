import 'package:flutter/material.dart';

import 'helpers/helpers.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.loginRoute,
    );
  }
}
