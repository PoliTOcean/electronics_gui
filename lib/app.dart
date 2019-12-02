import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';

import 'helpers/helpers.dart';
import 'resources/resources.dart';
import 'views/views.dart';

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Unauthenticated) {
            return LoginPage(userRepository: _userRepository);
          } else if (state is Authenticated) {
            return HomePage();
          } else {
            return Scaffold(
                body: Container(child: Center(child: Text('UNINITIALIZED'))));
          }
        },
      ),
    );
  }
}
