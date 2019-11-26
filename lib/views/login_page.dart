import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: LoginForm()));
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Student ID textfield
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(hintText: "Student ID"),
            keyboardType: TextInputType.number,
            validator: (value) {
              // 6 digits check for the Student ID
              if (value.length == 6 && int.parse(value) != null) {
                return null;
              }

              return 'Please enter a valid Student ID';
            },
          ),
          SizedBox(height: 10),
          // Password textfield
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(hintText: "Password"),
          ),
          SizedBox(height: 10),
          RaisedButton(
            child: Text("Login"),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
          )
        ],
      ),
    );
  }
}
