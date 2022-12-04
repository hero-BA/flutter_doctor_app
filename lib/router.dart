import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/features/auth/screens/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text(
                    'Page does not exist!',
                  ),
                ),
              ));
  }
}
