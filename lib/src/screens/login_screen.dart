import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            emailField(bloc),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(top: 20.0)),
            submitButton(context),
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Enter your email address',
                labelText: 'Email Address',
                errorText: snapshot.error),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Enter your password',
                labelText: 'Password',
                errorText: snapshot.error),
          );
        });
  }

  Widget submitButton(context) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/home');
      },
      child: Text('Login'),
      color: Colors.blue,
    );
  }
}
