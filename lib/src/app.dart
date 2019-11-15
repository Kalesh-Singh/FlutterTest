import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Login In',
        onGenerateRoute: routes,
        home: LoginScreen(),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return LoginScreen();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return HomeScreen();
        },
      );
    }
  }
}
