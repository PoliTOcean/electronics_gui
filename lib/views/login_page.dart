import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../resources/resources.dart';

class LoginPage extends StatelessWidget {
  final AuthRepository _authRepository;

  LoginPage({Key key, @required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ELEC database"),
          leading: Container(),
        ),
        body: Center(
          child: Container(
              width: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/politocean_logo.png'),
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  BlocProvider<LoginBloc>(
                    create: (context) =>
                        LoginBloc(authRepository: _authRepository),
                    child: LoginForm(authRepository: _authRepository),
                  )
                ],
              )),
        ));
  }
}

class LoginForm extends StatefulWidget {
  final AuthRepository _authRepository;

  LoginForm({Key key, @required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  AuthRepository get authRepository => widget._authRepository;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Logging in...'),
                  CircularProgressIndicator()
                ],
              ),
            ));
        } else if (state is LoginError) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text('Login failed.'), Icon(Icons.error)],
              ),
              backgroundColor: Colors.red,
            ));
        } else if (state is LoginSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Student ID textfield
            TextFormField(
              controller: _emailEditingController,
              autofocus: true,
              autocorrect: false,
              decoration: InputDecoration(
                  icon: Icon(Icons.email), hintText: "Student email"),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // 6 digits check for the Student ID
                if (RegExp(
                        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$')
                    .hasMatch(value)) {
                  return null;
                }

                return 'Please enter a valid Student email';
              },
            ),
            SizedBox(height: 10),
            // Password textfield
            TextFormField(
              controller: _passwordEditingController,
              autocorrect: false,
              obscureText: true,
              decoration:
                  InputDecoration(icon: Icon(Icons.lock), hintText: "Password"),
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text("Login"),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  BlocProvider.of<LoginBloc>(context).add(LoginWithCredentials(
                      email: _emailEditingController.text,
                      password: _passwordEditingController.text));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
