import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';

import 'helpers/helpers.dart';
import 'views/views.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginPage();
          } else if (state is Authenticated) {
            return Scaffold(
                body: Container(child: Center(child: Text('AUTHENTICATED'))));
          } else {
            return Scaffold(
                body: Container(child: Center(child: Text('UNINITIALIZED'))));
          }
        },
      ),
    );
  }
}
